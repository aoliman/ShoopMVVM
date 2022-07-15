//
//  LoginViewModel.swift
//  ShoopMVVM
//
//  Created by SH EG on 14/07/2022.
//

import Foundation
import Combine
class LoginViewModel : ObservableObject{
    @Published var userNameTextFieldModel :STextFieldModel 
    @Published var passwordTextFieldModel :STextFieldModel
    private var userProfileUseCase:UserProfileUseCase
    private var cancellables = Set<AnyCancellable>()

    init(userNameTextFieldModel :STextFieldModel,passwordTextFieldModel :STextFieldModel,userProfileUseCase:UserProfileUseCase){
        self.userNameTextFieldModel = userNameTextFieldModel
        self.passwordTextFieldModel = passwordTextFieldModel
        self.userProfileUseCase = userProfileUseCase
    }
    
    func getUserProfile(userId:String){
    userProfileUseCase.getUserProfile(userId: userId).sink { error in
           print(error)
        } receiveValue: { profileData in
            print(profileData)
            self.userNameTextFieldModel.text = profileData.userProfile.name ?? ""
            self.passwordTextFieldModel.text = profileData.userProfile.id
        }.store(in: &cancellables)

    }
    
    
    
    
    
}
