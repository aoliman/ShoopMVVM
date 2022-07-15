//
//  StringFormatter.swift
//  ShoopCore
//
//  Created by Mahmoud Elsheikh on 9/10/21.
//  Copyright © 2021 Shoop. All rights reserved.
//

import UIKit

open class StringFormatter {
    /// Generate QR Code as image
    /// - Parameter string: the text of QR code
    /// - Returns: QR code Image
    public static func generateQRCode(from string: String) -> UIImage? {
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
