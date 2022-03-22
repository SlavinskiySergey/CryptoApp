//
//  Asset.swift
//  Models
//

import Foundation

public protocol Asset {
    var id: String { get }
    var name: String { get }
    var symbol: String? { get }
    var priceUsd: Double { get }
}

public struct AssetModel: Asset {
    public let id: String
    public let name: String
    public let symbol: String?
    public let priceUsd: Double
    
    public init(id: String, name: String, symbol: String?, priceUsd: Double) {
        self.id = id
        self.name = name
        self.symbol = symbol
        self.priceUsd = priceUsd
    }
}
