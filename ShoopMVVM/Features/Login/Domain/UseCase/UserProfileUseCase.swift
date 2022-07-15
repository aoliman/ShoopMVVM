//
//  UserProfileUseCase.swift
//  ShoopMVVM
//
//  Created by SH EG on 15/07/2022.
//

import Foundation
import Combine
protocol UserProfileUseCase {
    func getUserProfile(userId:String)->Future<ProfileData,Error>
}

final class UserProfileUseCaseImp: UserProfileUseCase {
    private let userProfileRepository: UserProfileRepository
    init(userProfileRepository: UserProfileRepository) {
        self.userProfileRepository = userProfileRepository
    }

    func getUserProfile(userId:String) -> Future<ProfileData,Error>  {
        return userProfileRepository.getUserProfile(userId: userId)
    }
}
