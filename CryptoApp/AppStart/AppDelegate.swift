//
//  AppDelegate.swift
//  CryptoApp
//

import UIKit
import Components
import RootFeature

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    private var rootCoordinator: RootCoordinatorProtocol?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = AppWindow()
        self.rootCoordinator = RootBuilder(dependency: AppComponent()).build()
        self.rootCoordinator?.start(window: window)
                
        return true
    }
}

final class AppWindow: UIWindow {

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)

        switch traitCollection.userInterfaceStyle {
        case .dark where ThemeSwitcher.themeIndex == 0,
             .light where ThemeSwitcher.themeIndex == 1:
            ThemeSwitcher.chooseNextTheme()
        default:
            return
        }
    }
}


