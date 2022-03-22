//
//  Builder.swift
//  CryptoApp
//

import Foundation

public protocol BuilderProtocol: AnyObject {
}

open class Builder<DependencyType>: BuilderProtocol {
    public let dependency: DependencyType
    
    public init(dependency: DependencyType) {
        self.dependency = dependency
    }
}
