//
//  QrGenerator.swift
//  ShoopCore
//
//  Created by Hesham Ali on 9/19/21.
//  Copyright © 2021 Shoop. All rights reserved.
//

import Foundation
import UIKit
class QrGenerator {
    static func generateQRCode(from string: String) -> UIImage? {
        let data = string.data(using: String.Encoding.ascii)

        if let filter = CIFilter(name: "CIQRCodeGenerator") {
            filter.setValue(data, forKey: "inputMessage")
            let transform = CGAffineTransform(scaleX: 3, y: 3)

            if let output = filter.outputImage?.transformed(by: transform) {
                return UIImage(ciImage: output)
            }
        }

        return nil
    }
}
