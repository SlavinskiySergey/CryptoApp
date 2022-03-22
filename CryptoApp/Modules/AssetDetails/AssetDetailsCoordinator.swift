//
//  AssetDetailsCoordinator.swift
//  CryptoApp
//

import Foundation
import Module

protocol AssetDetailsCoordinatorProtocol: ViewableCoordinator {
    func openWebView(url: URL)
}

final class AssetDetailsCoordinator: ViewCoordinator {
    private let router: RouterProtocol
    private let webViewBuilder: WebViewBuilderProtocol
    
    init(
        router: RouterProtocol,
        presentable: Presentable,
        webViewBuilder: WebViewBuilderProtocol
    ) {
        self.router = router
        self.webViewBuilder = webViewBuilder
        super.init(presentable: presentable)
    }
}

extension AssetDetailsCoordinator: AssetDetailsCoordinatorProtocol {
    func openWebView(url: URL) {
        let coordinator = webViewBuilder.build(url: url)
        router.present(coordinator, isAniamted: true)
    }
}
