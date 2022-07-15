//
//  Stylable.swift
//  UIComponents
//
//  Created by Mahmoud Elsheikh on 8/5/21.
//  Copyright © 2021 Shoop. All rights reserved.
//

import UIKit
/// Every style for a component should implement style protocol
public protocol Style {
    init()
}
/// Every component to be themeable should implement this protocol
public protocol StyleApplyable {
    func styleChanged()
}
public protocol Stylable: AnyObject, StyleApplyable {
    associatedtype Style
    var style: Style { get set }
}
