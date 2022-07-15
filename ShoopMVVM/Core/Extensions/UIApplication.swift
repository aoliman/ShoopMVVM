//
//  UIApplication.swift
//  ShoopCore
//
//  Created by Mahmoud Elsheikh on 9/10/21.
//  Copyright © 2021 Shoop. All rights reserved.
//

import UIKit

extension UIApplication {
    public func topViewController() -> UIViewController? {
        guard let window = UIApplication.shared.keyWindow else { return nil }
        return topViewControllerRecursive(controller: window.rootViewController)
    }
    func topViewControllerRecursive(controller: UIViewController?) -> UIViewController? {
        if let navigationController = controller as? UINavigationController {
            return topViewControllerRecursive(controller: navigationController.visibleViewController)
        }
        if let tabController = controller as? UITabBarController,
            let selected = tabController.selectedViewController {
            return topViewControllerRecursive(controller: selected)
        }
        if let presented = controller?.presentedViewController {
            return topViewControllerRecursive(controller: presented)
        }
        return controller
    }
}
