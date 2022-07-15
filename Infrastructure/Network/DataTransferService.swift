//
//  DataTransfer.swift
//  ExampleMVVM
//
//  Created by Oleh Kudinov on 01.10.18.
//

import Foundation
import Combine
public enum DataTransferError: Error {
    case noResponse
    case parsing(Error)
    case networkFailure(NetworkError)
    case resolvedNetworkFailure(Error)
}

public protocol DataTransferService {
    @discardableResult
    func request<T: Decodable, E: ResponseRequestable>(with endpoint: E) -> Future<T,Error>? where E.Response == T
    @discardableResult
    func request<E: ResponseRequestable>(with endpoint: E) ->Future<Void,Error>? where E.Response == Void
}

public protocol DataTransferErrorResolver {
    func resolve(error: NetworkError) -> Error
}

public protocol ResponseDecoder {
    func decode<T: Decodable>(_ data: Data) throws -> T
}

public protocol DataTransferErrorLogger {
    func log(error: Error)
}

public final class DefaultDataTransferService {
    
    private let networkService: NetworkService
    private let errorResolver: DataTransferErrorResolver
    private let errorLogger: DataTransferErrorLogger
    private var cancellables = Set<AnyCancellable>()

    public init(with networkService: NetworkService,
                errorResolver: DataTransferErrorResolver = DefaultDataTransferErrorResolver(),
                errorLogger: DataTransferErrorLogger = DefaultDataTransferErrorLogger()) {
        self.networkService = networkService
        self.errorResolver = errorResolver
        self.errorLogger = errorLogger
    }
}

extension DefaultDataTransferService: DataTransferService {
    
    public func request<T: Decodable, E: ResponseRequestable>(with endpoint: E) -> Future<T,Error>? where E.Response == T {
        return Future<T,Error> { promise in
            self.networkService.request(endpoint: endpoint)?
            .compactMap{$0}
            .decode(type: T.self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { requestError in
                print(requestError)
                if case let .failure(requestError) = requestError {
                    switch requestError {
                    case let decodingError as DecodingError:
                        promise(.failure(decodingError))
                    case let apiError as NetworkError:
                        promise(.failure(apiError))
                    default:
                        promise(.failure(NetworkError.cancelled))
                    }
                }
            }, receiveValue: { result in
                promise(.success(result))
            })
            .store(in: &self.cancellables)
        }
        
        
        
    }

    public func request<E>(with endpoint: E) -> Future<Void,Error>? where E : ResponseRequestable, E.Response == Void {
        return Future<Void,Error> { promise in
            self.networkService.request(endpoint: endpoint)?
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { requestError in
                if case let .failure(requestError) = requestError {
                    self.errorLogger.log(error: requestError)
                    let error = self.resolve(networkError: requestError)
                    promise(.failure(error))
                }
            }, receiveValue: { result in
                promise(.success(()))
            })
            .store(in: &self.cancellables)
        }
    }

    // MARK: - Private
    private func decode<T: Decodable>(data: Data?, decoder: ResponseDecoder) -> Result<T, DataTransferError> {
        do {
            guard let data = data else { return .failure(.noResponse) }
            let result: T = try decoder.decode(data)
            return .success(result)
        } catch {
            self.errorLogger.log(error: error)
            return .failure(.parsing(error))
        }
    }
    
    private func resolve(networkError error: NetworkError) -> DataTransferError {
        let resolvedError = self.errorResolver.resolve(error: error)
        return resolvedError is NetworkError ? .networkFailure(error) : .resolvedNetworkFailure(resolvedError)
    }
}

// MARK: - Logger
public final class DefaultDataTransferErrorLogger: DataTransferErrorLogger {
    public init() { }
    
    public func log(error: Error) {
        printIfDebug("-------------")
        printIfDebug("\(error)")
    }
}

// MARK: - Error Resolver
public class DefaultDataTransferErrorResolver: DataTransferErrorResolver {
    public init() { }
    public func resolve(error: NetworkError) -> Error {
        return error
    }
}

// MARK: - Response Decoders
public class JSONResponseDecoder: ResponseDecoder {
    private let jsonDecoder = JSONDecoder()
    public init() { }
    public func decode<T: Decodable>(_ data: Data) throws -> T {
        return try jsonDecoder.decode(T.self, from: data)
    }
}

public class RawDataResponseDecoder: ResponseDecoder {
    public init() { }
    
    enum CodingKeys: String, CodingKey {
        case `default` = ""
    }
    public func decode<T: Decodable>(_ data: Data) throws -> T {
        if T.self is Data.Type, let data = data as? T {
            return data
        } else {
            let context = DecodingError.Context(codingPath: [CodingKeys.default], debugDescription: "Expected Data type")
            throw Swift.DecodingError.typeMismatch(T.self, context)
        }
    }
}
