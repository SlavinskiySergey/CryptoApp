//
//  WebViewCoordinator.swift
//  CryptoApp
//

import Foundation
import SafariServices
import Module

public protocol WebViewCoordinatorProtocol: ViewableCoordinator {
}

public final class WebViewCoordinator: BaseCoordinator {
    private let presentable: Presentable
    
    init(url: URL) {
        self.presentable = SFSafariViewController(url: url)
        super.init()
    }
}

extension WebViewCoordinator: WebViewCoordinatorProtocol {
    public var viewController: UIViewController {
        presentable.viewController
    }
}
