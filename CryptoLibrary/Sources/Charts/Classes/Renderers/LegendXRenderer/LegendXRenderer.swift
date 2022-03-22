//
//  LegendXRenderer.swift
//  Charts
//

import Foundation

public protocol LegendXRenderer: Renderer {
    func setTimestamps(_ timestamps: [Timestamp])
    func update(from fromIndex: Int, to toIndex: Int)
}
