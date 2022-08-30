//
//  ThemeSwitcher.swift
//  Components
//

import UIKit

protocol Theme {
    var name: String { get }
    var statusBarStyle: UIStatusBarStyle { get }
    var effect: UIVisualEffect { get }
    var colors: [ColorKey: UIColor] { get }
}


public final class ThemeSwitcher {
    private static let themes: [Theme] = [
        LightTheme(),
        DarkTheme()
    ]

    static var themeName: String {
        return themes[themeIndex].name
    }

    public static var nextThemeName: String {
        return themes[nextIndex].name
    }

    private(set) public static var themeIndex: Int = 0

    private static var nextIndex: Int {
        let nextIndex = themeIndex + 1
        if nextIndex == themes.count {
            return 0
        }
        return nextIndex
    }

    public static func chooseNextTheme() {
        themeIndex = nextIndex
        NotificationCenter.default.post(name: .themeUpdateNotificationName, object: nil)
    }

    public static func animateThemeChange() {
        guard let optionalWindow = UIApplication.shared.delegate?.window,
            let window = optionalWindow,
            let snapshot = window.snapshotView(afterScreenUpdates: false) else {
                return
        }

        window.addSubview(snapshot)
        snapshot.frame = window.bounds

        UIView.animate(
            withDuration: 0.2,
            delay: 0,
            options: .curveEaseInOut,
            animations: {
                snapshot.alpha = 0
            },
            completion: { _ in
                snapshot.removeFromSuperview()
            }
        )
    }

    static func colorPalette(for key: ColorKey) -> Palette {
        return Palette(objects: themes.compactMap { $0.colors[key] })
    }
    
    static func statusBarPalette() -> Palette {
        return Palette(objects: themes.compactMap { $0.statusBarStyle })
    }

    static func effectPalette() -> Palette {
        return Palette(objects: themes.compactMap { $0.effect })
    }

    private init() { }
}

extension NSNotification.Name {
    public static let themeUpdateNotificationName = NSNotification.Name(rawValue: "theme_update_notification_name")
}
