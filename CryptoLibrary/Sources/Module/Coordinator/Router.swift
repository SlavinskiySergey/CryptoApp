//
//  Router.swift
//  CryptoApp
//

import UIKit

public typealias NavigationBackClosure = (() -> ())

public protocol RouterProtocol: Presentable {
    func push(_ presentable: Presentable, isAnimated: Bool, onNavigateBack closure: NavigationBackClosure?)
    
    func present(_ presentable: Presentable, isAniamted: Bool)
    
    func setRootModule(_ module: Presentable)
}

public final class Router: NSObject, RouterProtocol {
    private let navigationController: UINavigationController
    
    private var closures: [String: NavigationBackClosure] = [:]

    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        super.init()
        self.navigationController.delegate = self
    }
    
    public func present(_ presentable: Presentable, isAniamted: Bool) {
        let viewController = presentable.viewController
        navigationController.present(viewController, animated: isAniamted, completion: nil)
    }

    public func push(_ presentable: Presentable, isAnimated: Bool, onNavigateBack closure: NavigationBackClosure?) {
        let viewController = presentable.viewController

        if let closure = closure {
            closures.updateValue(closure, forKey: viewController.description)
        }
        navigationController.pushViewController(viewController, animated: isAnimated)
    }
    
    public func setRootModule(_ module: Presentable) {
        let controller = module.viewController
        self.navigationController.setViewControllers([controller], animated: false)
    }

    private func executeClosure(_ viewController: UIViewController) {
        guard let closure = closures.removeValue(forKey: viewController.description) else { return }
        closure()
    }
}

// MARK: - Presentable
extension Router {
    public var viewController: UIViewController {
        navigationController
    }
}

// MARK: - UINavigationControllerDelegate
extension Router: UINavigationControllerDelegate {
    public func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {

        guard let previousController = navigationController.transitionCoordinator?.viewController(forKey: .from),
            !navigationController.viewControllers.contains(previousController) else {
                return
        }
        executeClosure(previousController)
    }
}
