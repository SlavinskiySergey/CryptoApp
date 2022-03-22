//
//  ChartRenderer.swift
//  Charts
//

import UIKit

public enum ChartSelectionType {
    case point
    case mask
    case none
}

public protocol ChartRenderer: Renderer {
    var selectionType: ChartSelectionType { get }

    var startsFromZero: Bool { get }

    func updateXValues(with timestampPoints: [CGFloat], linesCount: Int)
    func updateYValues(with valuePoints: [[GLfloat]])

    func update(with matrices: [[CGFloat]], colors: [CGFloat])
}

