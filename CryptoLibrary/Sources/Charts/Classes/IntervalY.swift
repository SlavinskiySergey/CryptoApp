//
//  IntervalY.swift
//  Charts
//

import CoreGraphics

public struct Interval<Value> {
    let min: Value
    let max: Value
}

public struct IntervalY: Animatable {
    var min: CGFloat
    var max: CGFloat

    var diff: CGFloat {
        return max - min
    }
}

extension IntervalY {
    public init() {
        min = .zero
        max = .zero
    }
}

public func + (lhs: IntervalY, rhs: IntervalY) -> IntervalY {
    return IntervalY(min: lhs.min + rhs.min, max: lhs.max + rhs.max)
}

public func - (lhs: IntervalY, rhs: IntervalY) -> IntervalY {
    return IntervalY(min: lhs.min - rhs.min, max: lhs.max - rhs.max)
}

public func * (lhs: IntervalY, progress: Double) -> IntervalY {
    return IntervalY(min: lhs.min * progress, max: lhs.max * progress)
}

public func == (lhs: IntervalY, rhs: IntervalY) -> Bool {
    return (lhs.min == rhs.min && lhs.max == rhs.max)
}

public func != (lhs: IntervalY, rhs: IntervalY) -> Bool {
    return !(lhs == rhs)
}

