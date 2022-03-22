//
//  UIActivityIndicatorView+Extensions.swift
//  Components
//

import UIKit
import Models

extension UIActivityIndicatorView {
    public func apply<Content>(state: ViewState<Content>) {
        if state.activityIndicatorHidden {
            stopAnimating()
        } else {
            startAnimating()
        }
    }
}

private extension ViewState {
    var activityIndicatorHidden: Bool {
        switch self {
        case .data,
             .error:
            return true
        case .loading:
            return false
        }
    }
}
