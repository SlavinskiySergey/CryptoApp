//
//  RootBuilder.swift
//  CryptoApp
//

import UIKit
import Module
import Components

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
        let navigationController = ThemedNavigationController()
        navigationController.statusBarStylePalette = Palette.statusBarStyle
        let router = Router(navigationController: navigationController)
        let component = RootComponent(dependency: dependency)
        let assetListBuilder = AssetListBuilder(dependency: component)
        return RootCoordinator(router: router, assetListBuilder: assetListBuilder)
    }
}
