//
//  AppDelegate.swift
//  ExampleMVVM
//
//  Created by Oleh Kudinov on 01.10.18.
//

import UIKit
import SwiftUI

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    let appDIContainer = AppDIContainer()
    var appFlowCoordinator: AppFlowCoordinator?
   

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        AppAppearance.setupAppearance()

        let navigationController = UINavigationController()
        appFlowCoordinator = AppFlowCoordinator(navigationController: navigationController,
                                                appDIContainer: appDIContainer)
        appFlowCoordinator?.start()
//        window?.makeKeyAndVisible()
//        window?.rootViewController = UIHostingController(rootView: LoginView())
        return true
    }

//    func applicationDidEnterBackground(_ application: UIApplication) {
//        CoreDataStorage.shared.saveContext()
//    }
}


//import SwiftUI
//
//@main
//struct LandmarksApp: App {
//    var body: some Scene {
//        WindowGroup {
//            LoginView()
//        }
//    }
//}
