//
//  WebViewBuilder.swift
//  CryptoApp
//

import Foundation
import Module

public protocol WebViewBuilderProtocol: BuilderProtocol {
    func build(url: URL) -> WebViewCoordinatorProtocol
}

public final class WebViewBuilder: Builder<WebViewDependency>  {
    public override init(dependency: WebViewDependency) {
        super.init(dependency: dependency)
    }
}

extension WebViewBuilder: WebViewBuilderProtocol {
    public func build(url: URL) -> WebViewCoordinatorProtocol {
        return WebViewCoordinator(url: url)
    }
}
