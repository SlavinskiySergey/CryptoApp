//
//  WebViewBuilder.swift
//  CryptoApp
//

import Foundation
import Module

protocol WebViewBuilderProtocol: BuilderProtocol {
    func build(url: URL) -> WebViewCoordinatorProtocol
}

final class WebViewBuilder: Builder<WebViewDependency>  {
    override init(dependency: WebViewDependency) {
        super.init(dependency: dependency)
    }
}

extension WebViewBuilder: WebViewBuilderProtocol {
    func build(url: URL) -> WebViewCoordinatorProtocol {
        return WebViewCoordinator(url: url)
    }
}
