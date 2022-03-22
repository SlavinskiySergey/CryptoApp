//
//  Models.swift
//  Charts
//

import UIKit

let chartHeight = UIScreen.main.bounds.width * 0.8
let contentInset: CGFloat = 16

public typealias ChannelValue = CGFloat
public typealias Timestamp = Date

public struct Channel {
    public let name: String
    public let color: UIColor
    public let values: [ChannelValue]
    
    public init(name: String, color: UIColor, values: [ChannelValue]) {
        self.name = name
        self.color = color
        self.values = values
    }
}

public struct DataSet {
    public let channels: [Channel]
    public let timestamps: [Timestamp]

    public let percentage: Bool
    public let stacked: Bool
    public let yScaled: Bool
    
    public init(channels: [Channel], timestamps: [Timestamp], percentage: Bool, stacked: Bool, yScaled: Bool) {
        self.channels = channels
        self.timestamps = timestamps
        self.percentage = percentage
        self.stacked = stacked
        self.yScaled = yScaled
    }
}
