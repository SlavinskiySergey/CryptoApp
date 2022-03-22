//
//  WebViewComponent.swift
//  CryptoApp
//

import Foundation
import Module

protocol WebViewDependency: Dependency {}

final class WebViewComponent: Component<WebViewDependency> {
    override init(dependency: WebViewDependency) {
        super.init(dependency: dependency)
    }
}
