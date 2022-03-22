//
//  AssetDetailsComponent.swift
//  CryptoApp
//

import Foundation
import ClientNetworkService
import Module

protocol AssetDetailsDependency: Dependency {
    var clientNetworkService: ClientNetworkServiceAsset { get }
}

final class AssetDetailsComponent: Component<AssetDetailsDependency> {
    override init(dependency: AssetDetailsDependency) {
        super.init(dependency: dependency)
    }
}
