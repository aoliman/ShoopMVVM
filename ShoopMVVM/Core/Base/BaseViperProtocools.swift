//
//  ViperBaseProtocools.swift
//  ShoopCore
//
//  Created by Mahmoud Elsheikh
//

import UIKit

public protocol WireframeProtocol: AnyObject {
    var viewController: UIViewController { get }
    var navigationController: UINavigationController? { get }
    var parentWireframe: WireframeProtocol? { get set }
    
    func pushChildWireframe(
        _ childWireframe: WireframeProtocol,
        animated: Bool
    )    
    func presentChildWireframe(
        _ childWireframe: WireframeProtocol,
        animated: Bool,
        completion: (() -> Void)?
    )
    func closeWireframe(animated: Bool, completion: (() -> Void)?)
}

public protocol ViewProtocol: AnyObject {}
public protocol PresenterProtocol: AnyObject {}
public protocol InteractorProtocol: AnyObject {}
