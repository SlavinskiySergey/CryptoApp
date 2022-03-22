//
//  AssetListDto+Domain.swift
//  ClientNetworkService
//

import Foundation
import Models

extension AssetDto {
    func domain() -> Asset {
        AssetModel(id: id,
                   name: slug,
                   symbol: symbol,
                   priceUsd: metrics.marketData.priceUsd)
    }
}
