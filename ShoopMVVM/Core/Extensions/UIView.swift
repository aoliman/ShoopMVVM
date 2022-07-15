//
//  Views.swift
//  ShoopCore
//
//  Created by Mahmoud Elsheikh
//

import UIKit

public extension UIView {
    func maskCorners(_ radius: CGFloat = 3.0,
                     corners: CACornerMask) {
        layer.cornerRadius = radius
        layer.maskedCorners = corners
    }
    func addShadow(offsetX: CGFloat = 0,
                   offsetY: CGFloat = 0,
                   color: UIColor = .black,
                   opacity: Float = 0.3,
                   radius: CGFloat = 5.0) {
        self.layer.masksToBounds = false
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOffset = CGSize(width: offsetX, height: offsetY)
        self.layer.shadowOpacity = opacity
        self.layer.shadowRadius = radius
    }
    var allSubviews: [UIView] {
        return self.subviews.flatMap { [$0] + $0.allSubviews }
    }
    func circular() {
        layer.cornerRadius = frame.height / 2
        layer.masksToBounds = true
    }
    func round(_ radius: CGFloat = 3.0) {
        layer.cornerRadius = radius
        layer.masksToBounds = true
    }
    func embed(_ view: UIView, inset: CGFloat = 0, height: CGFloat? = nil) {
        addSubview(view)
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.topAnchor.constraint(equalTo: topAnchor, constant: inset).isActive = true
        view.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -inset).isActive = true
        view.leadingAnchor.constraint(equalTo: leadingAnchor, constant: inset).isActive = true
        view.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -inset).isActive = true
        
        guard let height = height else { return }
        let heightConstraint = view.heightAnchor.constraint(greaterThanOrEqualToConstant: height)
        heightConstraint.priority = UILayoutPriority(rawValue: 900)
        heightConstraint.isActive = true
    }
    func removeAllConstraints() {
        var mysuperview = self.superview
        while let superview = mysuperview {
            for constraint in superview.constraints {
                if let first = constraint.firstItem as? UIView, first == self {
                    superview.removeConstraint(constraint)
                }
                if let second = constraint.secondItem as? UIView, second == self {
                    superview.removeConstraint(constraint)
                }
            }
            mysuperview = superview.superview
        }
        self.removeConstraints(self.constraints)
        self.translatesAutoresizingMaskIntoConstraints = true
    }
    func addBorder(_ color: UIColor = .black, width: CGFloat = 1.0) {
        layer.borderColor = color.cgColor
        layer.borderWidth = width
    }
}

public extension UIImage {
    func toQrCode() -> String {
        var qrAsString = ""
                guard let detector = CIDetector(ofType: CIDetectorTypeQRCode,
                                                context: nil,
                                                options: [CIDetectorAccuracy: CIDetectorAccuracyHigh]),
                    let ciImage = CIImage(image: self),
                    let features = detector.features(in: ciImage) as? [CIQRCodeFeature] else {
                        return qrAsString
                }

                for feature in features {
                    guard let indeedMessageString = feature.messageString else {
                        continue
                    }
                    qrAsString += indeedMessageString
                }

                return qrAsString
    }
}
