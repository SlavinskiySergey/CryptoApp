//
//  Presentable.swift
//  CryptoApp
//

import UIKit

public protocol Presentable {
    var viewController: UIViewController { get }
}

extension UIViewController: Presentable {
    public var viewController: UIViewController {
        return self
    }
}
