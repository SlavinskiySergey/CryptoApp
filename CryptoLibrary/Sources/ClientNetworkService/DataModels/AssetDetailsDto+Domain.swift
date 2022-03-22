//
//  AssetDetailsDto+Domain.swift
//  ClientNetworkService
//

import Foundation
import Models

extension AssetDetailsDto {
    func domain(asset: Asset) -> AssetDetails {
        let overview = data.profile.general.overview
        
        return AssetDetailsModel(
            id: asset.id,
            name: asset.name,
            symbol: asset.symbol,
            priceUsd: asset.priceUsd,
            details: overview.projectDetails,
            tagline: overview.tagline,
            links: overview.officialLinks?.map { $0.domain() } ?? []
        )
    }
}

extension OfficialLinkDto {
    func domain() -> Link {
        LinkModel(url: link, title: name)
    }
}
