//
//  ViewFormatter.swift
//  ShoopCore
//
//  Created by Mahmoud Elsheikh on 9/10/21.
//  Copyright © 2021 Shoop. All rights reserved.
//

import UIKit

open class ViewFormatter {
    public static func generateImage(from view: UIView) -> UIImage {
        let renderer = UIGraphicsImageRenderer(size: view.bounds.size)
        let image = renderer.image { _ in
            view.drawHierarchy(in: view.bounds, afterScreenUpdates: true)
        }
        return image
    }
}
