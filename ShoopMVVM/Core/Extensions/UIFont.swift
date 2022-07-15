//
//  UIFont.swift
//  ShoopCore
//
//  Created by Mahmoud Elsheikh on 9/1/21.
//  Copyright © 2021 Shoop. All rights reserved.
//

import UIKit
extension UIFont {
    /// Returns a new font with the weight specified
    /// - Parameter weight: The new font weight
    public func withWeight(_ weight: CGFloat) -> UIFont {
        let newDescriptor = fontDescriptor.addingAttributes([.traits: [
            UIFontDescriptor.TraitKey.weight: UIFont.Weight(weight)
        ]
        ])
        return UIFont(descriptor: newDescriptor, size: pointSize)
    }
   public static func availableFonts() {
        // Get all fonts families
        for family in UIFont.familyNames {
            NSLog("\(family)")
            // Show all fonts for any given family
            for name in UIFont.fontNames(forFamilyName: family) {
                NSLog("   \(name)")
            }
        }
    }
}
