//
//  BaseViewController.swift
//  ShoopCore
//
//  Created by Mahmoud Elsheikh on 8/8/21.
//  Copyright © 2021 Shoop. All rights reserved.
//

import UIKit

open class BaseViewController: UIViewController {
    override open func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.themeChanged(notification:)),
                                               name: Notification.Name("ThemeChanged"), object: nil)
    }
    @objc func themeChanged(notification: Any) {
        view.allSubviews.forEach { view in
            if let subview = view as? StyleApplyable {
                subview.styleChanged()
            }
        }
    }
}
