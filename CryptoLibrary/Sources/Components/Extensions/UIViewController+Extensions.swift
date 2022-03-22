//
//  UIViewController+Extensions.swift
//  Components
//

import UIKit

extension UIViewController {
    public func show(error: Error) {
        let alertController = UIAlertController(
            title: "Error",
            message: error.localizedDescription,
            preferredStyle: .alert
        )
        alertController.addAction(.init(
            title: "Cancel",
            style: .destructive,
            handler: nil)
        )
        present(alertController, animated: true, completion: nil)
    }
}
