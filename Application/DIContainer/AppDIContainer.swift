//
//  DIContainer.swift
//  ExampleMVVM
//
//  Created by Oleh Kudinov on 01.10.18.
//

import Foundation
import SwiftUI
final class AppDIContainer {
    
    lazy var appConfiguration = AppConfiguration()
    
    // MARK: - Network
public    lazy var apiDataTransferService: DataTransferService = {
        let config = ApiDataNetworkConfig(baseURL: URL(string: appConfiguration.apiBaseURL)!,
                                          queryParameters: [:])
        
        let apiDataNetwork = DefaultNetworkService(config: config)
        return DefaultDataTransferService(with: apiDataNetwork)
    }()
    // MARK: - DIContainers of scenes
    public    func makeLoginsSceneDIContainer() -> LoginSceneDIContainer {
        let dependencies = LoginSceneDIContainer.Dependencies(apiDataTransferService: apiDataTransferService)
        return LoginSceneDIContainer(dependencies: dependencies)
    
    }
}
