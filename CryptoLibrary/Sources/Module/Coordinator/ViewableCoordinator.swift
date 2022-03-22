//
//  ViewableCoordinator.swift
//  CryptoApp
//

import UIKit

public protocol ViewableCoordinator: Coordinator, Presentable {
}

open class ViewCoordinator: BaseCoordinator {
    let presentable: Presentable
    
    public init(presentable: Presentable) {
        self.presentable = presentable
    }
}

extension ViewCoordinator: ViewableCoordinator {
    public var viewController: UIViewController {
        presentable.viewController
    }
}
