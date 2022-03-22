//
//  AssetListBuilder.swift
//  CryptoApp
//

import Foundation
import Module

protocol AssetListBuilderProtocol: BuilderProtocol {
    func build(router: RouterProtocol) -> AssetListCoordinatorProtocol
}

final class AssetListBuilder: Builder<AssetListDependency>  {
    override init(dependency: AssetListDependency) {
        super.init(dependency: dependency)
    }
}

extension AssetListBuilder: AssetListBuilderProtocol {
    func build(router: RouterProtocol) -> AssetListCoordinatorProtocol {
        let viewModel = AssetListViewModel(clientNetworkService: dependency.clientNetworkService)
        let assetListVC = AssetListViewController(viewModel: viewModel)

        let component = AssetListComponent(dependency: dependency)
        let assetDetailsBuilder = AssetDetailsBuilder(dependency: component)
        
        let coordinator = AssetListCoordinator(router: router, presentable: assetListVC, assetDetailsBuilder: assetDetailsBuilder)
        viewModel.coordinator = coordinator
        return coordinator
    }
}
