//
//  AssetListDto.swift
//  ClientNetworkService
//

import Foundation

struct AssetListDto: Decodable {
    let data: [AssetDto]
}

struct AssetDto: Decodable {
    let id: String
    let slug: String
    let symbol: String?
    let metrics: MetricsDto
}

struct MetricsDto: Decodable {
    let marketData: MarketDataDto
    
    enum CodingKeys: String, CodingKey {
        case marketData = "market_data"
    }
}
    
struct MarketDataDto: Decodable {
    let priceUsd: Double
    
    enum CodingKeys: String, CodingKey {
        case priceUsd = "price_usd"
    }
}
