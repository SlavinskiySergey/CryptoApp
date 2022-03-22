//
//  AssetListComponent.swift
//  CryptoApp
//

import Foundation
import ClientNetworkService
import Module

protocol AssetListDependency: Dependency {
    var clientNetworkService: ClientNetworkServiceAsset { get }
}

final class AssetListComponent: Component<AssetListDependency> {
    override init(dependency: AssetListDependency) {
        super.init(dependency: dependency)
    }
}
