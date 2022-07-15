//
//  LoginSceneDIContainer.swift
//  ShoopMVVM
//
//  Created by SH EG on 09/07/2022.
//

import SwiftUI
class LoginSceneDIContainer {
    struct Dependencies {
        let apiDataTransferService: DataTransferService
    }

    private let dependencies: Dependencies

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
    
    // MARK: - Movies Queries Suggestions List
    func makeLoginView() -> UIHostingController<LoginView> {
        return UIHostingController(rootView: LoginView(loginViewModel: makeLoginViewModel()))
    }
    
    func makeLoginFlowCoordinator(navigationController: UINavigationController) -> LoginFlowCoordinator {
        return LoginFlowCoordinator(navigationController: navigationController)
    }
    
    func makeLoginViewModel () -> LoginViewModel{
        return LoginViewModel(userNameTextFieldModel: makeTextFieldModel(placeHolder:"Enter your email" ), passwordTextFieldModel: makeTextFieldModel(placeHolder: "Enter password"), userProfileUseCase: makeUserProfileUseCase())
    }
    
    func makeTextFieldModel (placeHolder:String)-> STextFieldModel{
        return STextFieldModel(text: "", errorMessage: nil, placeHolder: placeHolder)
    }
    
    func makeUserProfileUseCase()->UserProfileUseCase{
        return UserProfileUseCaseImp(userProfileRepository: makeUserProfileRepository())
    }
    
    func makeUserProfileRepository()->UserProfileRepository{
        return UserProfileRepositoryImp(dataTransferService: self.dependencies.apiDataTransferService)
    }
    
   
    
   

}
