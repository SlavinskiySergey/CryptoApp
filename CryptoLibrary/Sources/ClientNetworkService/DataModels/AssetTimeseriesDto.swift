//
//  AssetTimeseriesDto.swift
//  ClientNetworkService
//

import Foundation

struct AssetTimeseriesDto: Decodable {
    let data: AssetChartDto
}

struct AssetChartDto: Codable {
    let values: [[Double]]
}
