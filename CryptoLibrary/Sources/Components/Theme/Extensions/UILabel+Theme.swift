//
//  UILabel+Theme.swift
//  Components
//

import UIKit

extension UILabel {
    private var textColorBlock: PaletteBlock {
        return PaletteBlock(id: "text_color") { [weak self] color in
            self?.textColor = color as? UIColor
        }
    }

    public var textColorPalette: Palette? {
        get {
            return palettes[textColorBlock]
        }
        set {
            palettes[textColorBlock] = newValue
            textColor = newValue?.typedCurrent()
        }
    }
}
