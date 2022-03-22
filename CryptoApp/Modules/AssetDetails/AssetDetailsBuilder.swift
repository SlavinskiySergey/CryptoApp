//
//  AssetDetailsBuilder.swift
//  CryptoApp
//

import Foundation
import Models
import Module

protocol AssetDetailsBuilderProtocol: BuilderProtocol {
    func build(router: RouterProtocol, asset: Asset) -> AssetDetailsCoordinatorProtocol
}

final class AssetDetailsBuilder: Builder<AssetDetailsDependency>  {
    override init(dependency: AssetDetailsDependency) {
        super.init(dependency: dependency)
    }
}

extension AssetDetailsBuilder: AssetDetailsBuilderProtocol {
    func build(router: RouterProtocol, asset: Asset) -> AssetDetailsCoordinatorProtocol {
        let viewModel = AssetDetailsViewModel(asset: asset, clientNetworkService: dependency.clientNetworkService)
        let assetDetailsVC = AssetDetailsViewController(viewModel: viewModel)
        
        let component = AssetDetailsComponent(dependency: dependency)
        let webViewBuilder = WebViewBuilder(dependency: component)
        
        let coordinator = AssetDetailsCoordinator(router: router, presentable: assetDetailsVC, webViewBuilder: webViewBuilder)
        viewModel.coordinator = coordinator
        
        return coordinator
    }
}
