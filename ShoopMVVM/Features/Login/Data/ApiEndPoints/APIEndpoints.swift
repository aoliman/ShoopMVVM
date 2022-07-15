//
//  APIEndpoints.swift
//  ShoopMVVM
//
//  Created by SH EG on 14/07/2022.
//

import Foundation
struct APIEndpoints {
    
    static func loadUserData(userId: String,headers:[String:String]) -> Endpoint<ProfileDataResponse> {

        return Endpoint(path: "user/\(userId)/accounts",
                        method: .get,headerParameters: headers)
    }

    
}

//func loadUserData(userId: String) {
//    ProfileDataUserCase().loadProfileData(userId: userId) { [weak self] response, appError in
//        guard let response = response else {
//            self?.presenter?.handle(error: appError ?? AppError(message: ApiErrorMessages.defaultApiFaliureMessage, errorCode: -1))
//            return
//        }
//        self?.presenter?.successLoadingProfile(profile: response)
//    }
//}
