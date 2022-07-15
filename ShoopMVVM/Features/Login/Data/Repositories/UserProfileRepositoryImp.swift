//
//  UserProfileRepositoryImp.swift
//  ShoopMVVM
//
//  Created by SH EG on 15/07/2022.
//

import Foundation
import Combine
class UserProfileRepositoryImp {
    private let dataTransferService: DataTransferService
    private var cancellables = Set<AnyCancellable>()
    init(dataTransferService: DataTransferService) {
        self.dataTransferService = dataTransferService
    }
}
extension UserProfileRepositoryImp:UserProfileRepository{
    public func getUserProfile(userId:String) -> Future<ProfileData,Error> {
        let headers :[String:String] = ["Content-Type": "application/json; charset=utf-8", "deviceId": "fKeVLmHaE0W_mAhFRb-1Cg:APA91bGvRHClqtJsSQ513y-tAoBNYwI3WymkslSHIfHrKGuOmtlYcwfHNRqgoQ6fYm1BVDf-_Bp1NdA9iI-fPMie4FgIvtBCgEuXRIsup4GPNStBKBdycgXzaqXapAa00WQAGuvAoe2a", "Connection": "keep-alive", "authToken": "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImtpZCI6IjJaUXBKM1VwYmpBWVhZR2FYRUpsOGxWMFRPSSJ9.eyJhdWQiOiJhYTRhNzQ5OS1lMzRiLTQ5MTgtOTQ2Ni1mN2U3NTJlYzlhMjgiLCJpc3MiOiJodHRwczovL2xvZ2luLm1pY3Jvc29mdG9ubGluZS5jb20vNGRjYWRiZGMtNjAyYy00NTRhLTlkYmQtMTg2YjE5ZmFlNDc5L3YyLjAiLCJpYXQiOjE2NTY0MDU0MjYsIm5iZiI6MTY1NjQwNTQyNiwiZXhwIjoxNjU2NDA5NDA1LCJhaW8iOiJBVFFBeS84VEFBQUFHM09wMFJENnFrZWx3RU42b1prWmhlY0I4YzJWTGRLRXlDV2tXSnJPTU5zbWJIbWdVV0tWQzBEb1g1akp5SnhIIiwiYXpwIjoiMmI3MDAxMTQtNjZlMi00MDYzLWJkNmQtNGRkOTAwZGE5M2JmIiwiYXpwYWNyIjoiMCIsIm5hbWUiOiJkaXdpZm81NTExQGN1cGJlc3QuY29tIiwib2lkIjoiNTRiZGRmOGQtMzViOS00NDc4LThiMjMtYjMzYjBkNzFkODc4IiwicHJlZmVycmVkX3VzZXJuYW1lIjoiNTRiZGRmOGQtMzViOS00NDc4LThiMjMtYjMzYjBkNzFkODc4QHNob29wdWF0Lm9ubWljcm9zb2Z0LmNvbSIsInJoIjoiMC5BU0lBM052S1RTeGdTa1dkdlJockdmcmtlWmwwU3FwTDR4aEpsR2IzNTFMc21pZ3lBRkkuIiwic2NwIjoidXNlcl9pbXBlcnNvbmF0aW9uIiwic3ViIjoiWE42WnFKQVNxZUJXWjhQWDVUa0NGNGJJYnVaRzNsWUd5VURMV0J3VFNoayIsInRpZCI6IjRkY2FkYmRjLTYwMmMtNDU0YS05ZGJkLTE4NmIxOWZhZTQ3OSIsInV0aSI6IkMzR3N4Zllyb0V1bnU5UjRudmFTQUEiLCJ2ZXIiOiIyLjAifQ.I71pKAohVh_e1_7JVmiWwlFiCEfdRp5TZwcgocbGYyQUEAISGLcpSDdLzNDykoX0k-VWfuPqwwyCExtZZhlDZGvaF2W2pBDiem5uXa5gUyCRaw49FZ-S4-YLXoDyC5SCWcLpTIIelSAuLNkVoFPNvbfQ0gRM7ND6kh9PToA8ROCeXImu0_AmUyDkFWZ13CsIIpRa51MPm1qXWhTHDh6dEa4xXQKP3mavDjoKkKr6WwqFTDlWTptpfriNH0bWlOq4vE_gbD_l3e8FjcmDf9xgsB6fX7Ue4G7ueh4hNuKx3g8BIllkBzzBvhpySfsJeF3BuW4-dMHMtpzxgesArT5pEw", "Vary": "Accept-Encoding", "Accept-Encoding": "gzip, deflate, br", "deviceType": "iphone", "userId": "9d94dc74-e5b7-4d08-ab2f-14fe450ada88", "Ocp-Apim-Subscription-Key": "d09af316cb704e3d9782c87b57262b04"]
        
        let endpoint = APIEndpoints.loadUserData(userId: userId, headers: headers)
        
        return Future<ProfileData,Error>{ promise in
            self.dataTransferService.request(with: endpoint)?.sink(receiveCompletion: { error in
                if case let .failure(requestError) = error {
                    promise(.failure(requestError))
                }
            }, receiveValue: { profileData in
                promise(.success(profileData.data))
            }).store(in: &self.cancellables)
            
        }
    }
}
