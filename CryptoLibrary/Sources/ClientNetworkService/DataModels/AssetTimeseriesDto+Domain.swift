//
//  AssetTimeseriesDto+Domain.swift
//  ClientNetworkService
//

import Foundation
import Models

extension AssetTimeseriesDto {
    func domain() -> ChartDataSet {
        var values: [Double] = []
        var timestamps: [Date] = []
        
        for item in data.values {
            if let value = item.dropFirst().first {
                values.append(value)
            }
            if let timeInterval = item.first {
                timestamps.append(Date(timeIntervalSince1970: timeInterval / 1000))
            }
        }
        return ChartDataSet(values: values, timestamps: timestamps)
    }
}
