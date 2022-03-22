//
//  Component.swift
//  CryptoApp
//

import Foundation

public protocol Dependency: AnyObject {}

open class Component<DependencyType>: Dependency {
    public let dependency: DependencyType
    
    public init(dependency: DependencyType) {
        self.dependency = dependency
    }
}
