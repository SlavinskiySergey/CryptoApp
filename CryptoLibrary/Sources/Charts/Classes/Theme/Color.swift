//
//  Color.swift
//  Charts
//

import UIKit

enum ColorKey: Int {
    case arrowColor
    case backgroundContent
    case captionColor
    case chartLine
    case dateColor
    case deselectedColor
    case maskColor
    case tint
    case yColor
}

struct Palette {
    let objects: [Any]

    func current() -> Any {
        return objects[ThemeSelector.themeIndex]
    }

    func typedCurrent<Type>() -> Type? {
        return current() as? Type
    }
}

extension Palette {
    static var arrowColor: Palette {
        return ThemeSelector.colorPalette(for: .arrowColor)
    }
    
    static var backgroundContentColor: Palette {
        return ThemeSelector.colorPalette(for: .backgroundContent)
    }
    
    static var captionColor: Palette {
        return ThemeSelector.colorPalette(for: .captionColor)
    }
    
    static var chartLine: Palette {
        return ThemeSelector.colorPalette(for: .chartLine)
    }

    static var dateColor: Palette {
        return ThemeSelector.colorPalette(for: .dateColor)
    }
    
    static var deselectedColor: Palette {
        return ThemeSelector.colorPalette(for: .deselectedColor)
    }
    
    static var effect: Palette {
        return ThemeSelector.effectPalette()
    }
    
    static var maskColor: Palette {
        return ThemeSelector.colorPalette(for: .maskColor)
    }
    
    static var tintColor: Palette {
        return ThemeSelector.colorPalette(for: .tint)
    }
    
    static var yColor: Palette {
        return ThemeSelector.colorPalette(for: .yColor)
    }
}
