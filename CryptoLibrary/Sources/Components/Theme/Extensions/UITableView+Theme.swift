//
//  UITableView+Theme.swift
//  Components
//

import UIKit

extension UITableView {
    private var separatorColorBlock: PaletteBlock {
        return PaletteBlock(id: "separator_color") { [weak self] color in
            self?.separatorColor = color as? UIColor
        }
    }

    public var separatorColorPalette: Palette? {
        get {
            return palettes[separatorColorBlock]
        }
        set {
            palettes[separatorColorBlock] = newValue
            separatorColor = newValue?.typedCurrent()
        }
    }
}
