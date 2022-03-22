//
//  RootCoordinator.swift
//  CryptoApp
//

import UIKit
import Module

protocol RootCoordinatorProtocol: ViewableCoordinator {
    func start(window: UIWindow?)
}

final class RootCoordinator: ViewCoordinator, RootCoordinatorProtocol {
    private lazy var instructor: RootInstructor = {
        return RootInstructor.configure()
    }()
        
    private let router: RouterProtocol
    private let assetListBuilder: AssetListBuilderProtocol
    
    init(
        router: RouterProtocol,
        assetListBuilder: AssetListBuilderProtocol
    ) {
        self.router = router
        self.assetListBuilder = assetListBuilder
        super.init(presentable: router)
    }

    override func start() {
        guard let window = UIApplication.shared.delegate?.window else {
            return
        }
        start(window: window)
    }
    
    func start(window: UIWindow?) {
        window?.rootViewController = router.viewController
        window?.makeKeyAndVisible()

        switch instructor {
        case .main: runMainFlow(window: window)
        }
    }

    private func runMainFlow(window: UIWindow?) {
        let coordinator = assetListBuilder.build(router: router)
        addDependency(coordinator)
        coordinator.start()
        
        router.setRootModule(coordinator)
    }
}

private enum RootInstructor {
    /*
     Add more cases when have to implement several flows at Root time
     */

    case main

    static func configure() -> RootInstructor {
        return .main
    }
}
