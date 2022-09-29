//
//  AssetListComponent+AssetDetails.swift
//  CryptoApp
//

import AssetDetailsFeature
import Foundation
import ClientNetworkService

extension AssetListComponent: AssetDetailsDependency {
    var clientNetworkService: ClientNetworkServiceAsset {
        dependency.clientNetworkService
    }
}
