//
//  Color.swift
//  Components
//

import UIKit

enum ColorKey: Int {
    case actionColor
    case arrowColor
    case backgroundContent
    case backgroundPage
    case captionColor
    case chartLine
    case dateColor
    case deselectedColor
    case maskColor
    case separator
    case tint
    case yColor
    case titleColor
}

public struct Palette {
    let objects: [Any]

    func current() -> Any {
        return objects[ThemeSwitcher.themeIndex]
    }

    public func typedCurrent<Type>() -> Type? {
        return current() as? Type
    }
}

extension Palette {
    public static var actionColor: Palette {
        return ThemeSwitcher.colorPalette(for: .actionColor)
    }
    
    public static var arrowColor: Palette {
        return ThemeSwitcher.colorPalette(for: .arrowColor)
    }
    
    public static var statusBarStyle: Palette {
        return ThemeSwitcher.statusBarPalette()
    }
    
    public static var backgroundContentColor: Palette {
        return ThemeSwitcher.colorPalette(for: .backgroundContent)
    }
    
    public static var backgroundPageColor: Palette {
        return ThemeSwitcher.colorPalette(for: .backgroundPage)
    }
    
    public static var captionColor: Palette {
        return ThemeSwitcher.colorPalette(for: .captionColor)
    }
    
    public static var chartLine: Palette {
        return ThemeSwitcher.colorPalette(for: .chartLine)
    }

    public static var dateColor: Palette {
        return ThemeSwitcher.colorPalette(for: .dateColor)
    }
    
    public static var deselectedColor: Palette {
        return ThemeSwitcher.colorPalette(for: .deselectedColor)
    }
    
    public static var effect: Palette {
        return ThemeSwitcher.effectPalette()
    }
    
    public static var maskColor: Palette {
        return ThemeSwitcher.colorPalette(for: .maskColor)
    }
    
    public static var separatorColor: Palette {
        return ThemeSwitcher.colorPalette(for: .separator)
    }
    
    public static var tintColor: Palette {
        return ThemeSwitcher.colorPalette(for: .tint)
    }
    
    public static var yColor: Palette {
        return ThemeSwitcher.colorPalette(for: .yColor)
    }
    
    public static var titleColor: Palette {
        return ThemeSwitcher.colorPalette(for: .titleColor)
    }
}
