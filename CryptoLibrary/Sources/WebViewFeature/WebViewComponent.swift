//
//  WebViewComponent.swift
//  CryptoApp
//

import Foundation
import Module

public protocol WebViewDependency: Dependency {}

final class WebViewComponent: Component<WebViewDependency> {
    override init(dependency: WebViewDependency) {
        super.init(dependency: dependency)
    }
}
