//
//  AssetListCoordinator.swift
//  CryptoApp
//

import Foundation
import Models
import Module

protocol AssetListCoordinatorProtocol: ViewableCoordinator {
    func openDetails(asset: Asset)
}

final class AssetListCoordinator: ViewCoordinator {
    private let router: RouterProtocol
    private let assetDetailsBuilder: AssetDetailsBuilderProtocol
    
    init(
        router: RouterProtocol,
        presentable: Presentable,
        assetDetailsBuilder: AssetDetailsBuilderProtocol
    ) {
        self.router = router
        self.assetDetailsBuilder = assetDetailsBuilder
        super.init(presentable: presentable)
    }         
}

extension AssetListCoordinator: AssetListCoordinatorProtocol {    
    func openDetails(asset: Asset) {
        let coordinator = assetDetailsBuilder.build(router: router, asset: asset)
        addDependency(coordinator)
        coordinator.start()
        
        router.push(coordinator, isAnimated: true) { [weak self, weak coordinator] in
            self?.removeDependency(coordinator)
        }
    }
}
