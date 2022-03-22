//
//  ChartDataSet.swift
//  Models
//

import Foundation

public struct ChartDataSet {
    public let values: [Double]
    public let timestamps: [Date]
    
    public init(values: [Double], timestamps: [Date]) {
        self.values = values
        self.timestamps = timestamps
    }
}
