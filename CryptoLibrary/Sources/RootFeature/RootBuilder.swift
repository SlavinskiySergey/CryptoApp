//
//  RootBuilder.swift
//  CryptoApp
//

import AssetListFeature
import UIKit
import Module
import Components

public protocol RootBuilderProtocol: BuilderProtocol {
    func build() -> RootCoordinatorProtocol
}

public final class RootBuilder: Builder<RootDependency> {
    public override init(dependency: RootDependency) {
        super.init(dependency: dependency)
    }
}

extension RootBuilder: RootBuilderProtocol {
    public func build() -> RootCoordinatorProtocol {
        let navigationController = ThemedNavigationController()
        navigationController.statusBarStylePalette = Palette.statusBarStyle
        let router = Router(navigationController: navigationController)
        let component = RootComponent(dependency: dependency)
        let assetListBuilder = AssetListBuilder(dependency: component)
        return RootCoordinator(router: router, assetListBuilder: assetListBuilder)
    }
}
