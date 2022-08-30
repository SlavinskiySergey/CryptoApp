//
//  ThemedNavigationController.swift
//  Components
//  

import UIKit

public final class ThemedNavigationController: UINavigationController {

    private var statusBarStyleBlock: PaletteBlock {
        return PaletteBlock(id: "status_bar_style") { [weak self] style in
            self?.overridenStatusBarStyle = style as? UIStatusBarStyle
            self?.navigationBar.setNeedsLayout()
        }
    }

    public var statusBarStylePalette: Palette? {
        get {
            return palettes[statusBarStyleBlock]
        }
        set {
            palettes[statusBarStyleBlock] = newValue
            overridenStatusBarStyle = newValue?.typedCurrent()
        }
    }

    private var overridenStatusBarStyle: UIStatusBarStyle? {
        didSet {
            setNeedsStatusBarAppearanceUpdate()
        }
    }

    public override var preferredStatusBarStyle: UIStatusBarStyle {
        return overridenStatusBarStyle ?? super.preferredStatusBarStyle
    }

    public override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
        return .fade
    }

    public override func viewDidLoad() {
        super.viewDidLoad()

        navigationBar.isTranslucent = false
        navigationBar.barTintColorPalette = Palette.backgroundContentColor
        navigationBar.tintColorPalette = Palette.actionColor
        navigationBar.titleColorPalette = Palette.tintColor
    }
}
