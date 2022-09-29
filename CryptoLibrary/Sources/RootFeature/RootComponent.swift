//
//  RootComponent.swift
//  CryptoApp
//

import AssetListFeature
import Foundation
import ClientNetworkService
import NetworkService
import Module

public protocol RootDependency: Dependency {
}

final class RootComponent: Component<RootDependency> {
    private let sharedClientNetworkService: ClientNetworkService
    
    override init(dependency: RootDependency) {
        let baseURL = URL(string: "https://data.messari.io")
        let networkService = NetworkServiceImpl(baseURL: baseURL)
        self.sharedClientNetworkService = ClientNetworkServiceImpl(networkService: networkService)
        
        super.init(dependency: dependency)
    }
}

extension RootComponent: AssetListDependency {
    var clientNetworkService: ClientNetworkServiceAsset {
        sharedClientNetworkService
    }
}
