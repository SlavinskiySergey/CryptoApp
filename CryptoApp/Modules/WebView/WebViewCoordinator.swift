//
//  WebViewCoordinator.swift
//  CryptoApp
//

import Foundation
import SafariServices
import Module

protocol WebViewCoordinatorProtocol: ViewableCoordinator {
}

final class WebViewCoordinator: BaseCoordinator {
    private let presentable: Presentable
    
    init(url: URL) {
        self.presentable = SFSafariViewController(url: url)
        super.init()
    }
}

extension WebViewCoordinator: WebViewCoordinatorProtocol {
    var viewController: UIViewController {
        presentable.viewController
    }
}
