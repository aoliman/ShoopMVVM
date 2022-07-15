//
//  Storyboard.swift
//  ShoopCore
//
//  Created by Mahmoud Elsheikh
//

//import UIKit
//
//extension UIStoryboard {
//    func instantiateViewController<T>(with identifier: String? = nil) -> T where T: StoryboardInstantiable {
//        let storyboardID = identifier ?? T.storyboardIdentifier
//        guard let viewController = instantiateViewController(withIdentifier: storyboardID) as? T else {
//            fatalError("Couldn't instantiate view controller with identifier \(storyboardID)")
//        }
//        return viewController
//    }
//}

//public protocol StoryboardInstantiable {
//    static var storyboardIdentifier: String { get }
//}
//
//extension StoryboardInstantiable where Self: UIViewController {
//    public static var storyboardIdentifier: String {
//        return String(describing: self)
//    }
//
//    public static func create(with identifier: String? = nil, bundle: Bundle? = nil, hasIpadDesign: Bool = false) -> Self {
//        let storyboardID = identifier ?? storyboardIdentifier
//        let storyboard = UIStoryboard(name: storyboardID, bundle: bundle)
//        return storyboard.instantiateViewController(with: hasIpadDesign ? "Ipad" + storyboardID  : identifier)
//    }
//}
//
//extension NSLayoutConstraint {
//    public func constraintWithMultiplier(_ multiplier: CGFloat) -> NSLayoutConstraint {
//        return NSLayoutConstraint(item: self.firstItem!, attribute: self.firstAttribute, relatedBy: self.relation, toItem: self.secondItem, attribute: self.secondAttribute, multiplier: multiplier, constant: self.constant)
//    }
//}
//
// extension UIViewController: StoryboardInstantiable {}
