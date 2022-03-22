//
//  AppComponent.swift
//  CryptoApp
//

import Foundation
import Module

protocol EmptyDependency: Dependency {}

final class EmptyComponent: EmptyDependency {}

final class AppComponent: Component<EmptyDependency>, RootDependency {
    init() {
        super.init(dependency: EmptyComponent())
    }
}
