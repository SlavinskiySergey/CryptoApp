//
//  YCalculator.swift
//  Charts
//

import Foundation

public protocol YCalculator: AnyObject {
    var ysCount: Int { get }

    func calculateYIntervals(
        for channels: [Channel],
        disabledIndexes: IndexSet,
        leftIndex: Int,
        rightIndex: Int
    ) -> [IntervalY]
}
