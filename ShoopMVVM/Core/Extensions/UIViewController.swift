//
//  UIViewController.swift
//  ShoopCore
//
//  Created by Mahmoud Elsheikh
//

import UIKit

extension UIViewController {
    /// Determines if this view controller was modally presented
    var isPresented: Bool {
        if let index = navigationController?.viewControllers.firstIndex(of: self), index > 0 {
            return false
        } else if presentingViewController != nil {
            return true
        } else if navigationController?.presentingViewController?.presentedViewController == navigationController {
            return true
        } else if tabBarController?.presentingViewController is UITabBarController {
            return true
        } else {
            return false
        }
    }
}
