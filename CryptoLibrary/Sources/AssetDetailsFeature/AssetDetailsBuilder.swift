//
//  AssetDetailsBuilder.swift
//  CryptoApp
//

import Foundation
import Models
import Module
import WebViewFeature

public protocol AssetDetailsBuilderProtocol: BuilderProtocol {
    func build(router: RouterProtocol, asset: Asset) -> AssetDetailsCoordinatorProtocol
}

public final class AssetDetailsBuilder: Builder<AssetDetailsDependency>  {
    public override init(dependency: AssetDetailsDependency) {
        super.init(dependency: dependency)
    }
}

extension AssetDetailsBuilder: AssetDetailsBuilderProtocol {
    public func build(router: RouterProtocol, asset: Asset) -> AssetDetailsCoordinatorProtocol {
        let viewModel = AssetDetailsViewModel(asset: asset, clientNetworkService: dependency.clientNetworkService)
        let assetDetailsVC = AssetDetailsViewController(viewModel: viewModel)
        
        let component = AssetDetailsComponent(dependency: dependency)
        let webViewBuilder = WebViewBuilder(dependency: component)
        
        let coordinator = AssetDetailsCoordinator(router: router, presentable: assetDetailsVC, webViewBuilder: webViewBuilder)
        viewModel.coordinator = coordinator
        
        return coordinator
    }
}
