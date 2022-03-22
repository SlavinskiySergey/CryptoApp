//
//  AppDelegate.swift
//  CryptoApp
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    private var rootCoordinator: RootCoordinatorProtocol?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.rootCoordinator = RootBuilder(dependency: AppComponent()).build()
        self.rootCoordinator?.start(window: window)
                
        return true
    }
}

