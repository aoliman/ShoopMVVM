//
//  AppFlowCoordinator.swift
//  ExampleMVVM
//
//  Created by Oleh Kudinov on 03.03.19.
//

import UIKit
import SwiftUI
final class AppFlowCoordinator {

    var navigationController: UINavigationController
    private let appDIContainer: AppDIContainer
    var window: UIWindow?
    init(navigationController: UINavigationController,
         appDIContainer: AppDIContainer) {
        self.navigationController = navigationController
        self.appDIContainer = appDIContainer
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
    }

    func start() {
        // In App Flow we can check if user needs to login, if yes we would run login flow
        let loginSceneDIContainer = appDIContainer.makeLoginsSceneDIContainer()
        window?.rootViewController = loginSceneDIContainer.makeLoginView()
        window?.makeKeyAndVisible()
    }
}
