//
//  ClientNetworkService+Asset.swift
//  ClientNetworkService
//

import Foundation
import RxSwift
import NetworkService
import Models

public protocol ClientNetworkServiceAsset {
    func assets(page: Int) -> Observable<List<Asset>>
    func assetDetails(for asset: Asset) -> Observable<AssetDetails>
    func chartDataSet(for asset: Asset) -> Observable<ChartDataSet>
}

extension ClientNetworkServiceImpl: ClientNetworkServiceAsset {
    public func assets(page: Int) -> Observable<List<Asset>> {
        let endpoint: APIEndpoint<AssetListDto> = .json(
            request: .init(
                path: "/api/v2/assets",
                method: .GET,
                query: ["fields" : "id,slug,symbol,metrics/market_data/price_usd",
                        "page" : "\(page)"]
            )
        )
        return networkService.call(endpoint: endpoint)
            .map { assetsListDto in
                return List(page: page,
                            hasMore: !assetsListDto.data.isEmpty,
                            items: assetsListDto.data.map { $0.domain() })
            }
    }
    
    public func assetDetails(for asset: Asset) -> Observable<AssetDetails> {
        let endpoint: APIEndpoint<AssetDetailsDto> = .json(
            request: .init(
                path: "/api/v2/assets/\(asset.name)/profile",
                method: .GET,
                query: ["fields" : "profile/general/overview/tagline,profile/general/overview/project_details,profile/general/overview/official_links"]
            )
        )
        return networkService.call(endpoint: endpoint)
            .map { $0.domain(asset: asset) }
    }
    
    public func chartDataSet(for asset: Asset) -> Observable<ChartDataSet> {
        var query: [String: String] = [
            "interval" : "1d",
            "columns"  : "timestamp,close"
        ]
        query["after"] = Date().byAddingMonths(-1)?.string(.mirroredDate)
        
        let endpoint: APIEndpoint<AssetTimeseriesDto> = .json(
            request: .init(
                path: "/api/v1/assets/\(asset.name)/metrics/price/time-series",
                method: .GET,
                query: query
            )
        )
        return networkService.call(endpoint: endpoint)
            .map { $0.domain() }
    }
}
