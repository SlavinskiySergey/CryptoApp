//
//  AssetDetails.swift
//  Models
//

import Foundation

public protocol AssetDetails: Asset {
    var details: String? { get }
    var tagline: String? { get }
    var links: [Link] { get }
}

public struct AssetDetailsModel: AssetDetails {
    public let id: String
    public let name: String
    public let symbol: String?
    public let priceUsd: Double
    
    public let details: String?
    public let tagline: String?
    public let links: [Link]
    
    public init(id: String, name: String, symbol: String?, priceUsd: Double, details: String?, tagline: String?, links: [Link]) {
        self.id = id
        self.name = name
        self.symbol = symbol
        self.priceUsd = priceUsd
        self.details = details
        self.tagline = tagline
        self.links = links
    }
    
    public init(asset: Asset) {
        self.id = asset.id
        self.name = asset.name
        self.symbol = asset.symbol
        self.priceUsd = asset.priceUsd
        self.details = nil
        self.tagline = nil
        self.links = []
    }
}
