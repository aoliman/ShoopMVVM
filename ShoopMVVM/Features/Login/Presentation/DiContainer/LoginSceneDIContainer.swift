//
//  LoginSceneDIContainer.swift
//  ShoopMVVM
//
//  Created by SH EG on 09/07/2022.
//

import SwiftUI
class LoginSceneDIContainer {
//    struct Dependencies {
//        let apiDataTransferService: DataTransferService
//        let imageDataTransferService: DataTransferService
//    }
//
//    private let dependencies: Dependencies
//
//    init(dependencies: Dependencies) {
//        self.dependencies = dependencies
//    }
    
    // MARK: - Movies Queries Suggestions List
    func LoginViewController() -> UIViewController {
            return UIHostingController(rootView: LoginView())
    }
    
    func makeLoginFlowCoordinator(navigationController: UINavigationController) -> LoginFlowCoordinator {
        return LoginFlowCoordinator(navigationController: navigationController)
    }
    
}
