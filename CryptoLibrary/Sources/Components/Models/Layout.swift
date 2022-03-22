//
//  Layout.swift
//  Components
//

import CoreGraphics

public enum Layout {
    case insets(CGFloat)
}

extension Layout {
    var constraints: [Constraint] {
        switch self {
        case .insets(let inset):
            return [
                equal(\.topAnchor, constant: inset),
                equal(\.leadingAnchor, constant: inset),
                equal(\.trailingAnchor, constant: -inset),
                equal(\.bottomAnchor, constant: -inset)
                ]
        }
    }
}

