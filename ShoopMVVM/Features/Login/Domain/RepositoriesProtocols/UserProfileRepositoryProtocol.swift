//
//  UserProfileRepositoryProtocol.swift
//  ShoopMVVM
//
//  Created by SH EG on 15/07/2022.
//

import Foundation
import Combine
protocol UserProfileRepository {
    func getUserProfile(userId:String) -> Future<ProfileData,Error>
}
