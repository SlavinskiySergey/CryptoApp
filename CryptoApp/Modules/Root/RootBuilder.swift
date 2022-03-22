//
//  RootBuilder.swift
//  CryptoApp
//

import UIKit
import Module

protocol RootBuilderProtocol: BuilderProtocol {
    func build() -> RootCoordinatorProtocol
}

final class RootBuilder: Builder<RootDependency> {
    override init(dependency: RootDependency) {
        super.init(dependency: dependency)
    }
}

extension RootBuilder: RootBuilderProtocol {
    func build() -> RootCoordinatorProtocol {
        let router = Router(navigationController: UINavigationController())
        let component = RootComponent(dependency: dependency)
        let assetListBuilder = AssetListBuilder(dependency: component)
        return RootCoordinator(router: router, assetListBuilder: assetListBuilder)
    }
}
