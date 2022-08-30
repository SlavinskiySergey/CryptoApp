//
//  UIActivityIndicatorView+Theme.swift
//  Components
//

import UIKit

extension UIActivityIndicatorView {
    private var colorBlock: PaletteBlock {
        return PaletteBlock(id: "activity_color") { [weak self] value in
            self?.color = value as? UIColor
        }
    }

    public var colorPalette: Palette? {
        get {
            return palettes[colorBlock]
        }
        set {
            palettes[colorBlock] = newValue
            color = newValue?.typedCurrent()
        }
    }
}
