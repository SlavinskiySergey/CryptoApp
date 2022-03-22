//
//  UIStackView+Extensions.swift
//  Components
//

import UIKit

extension UIStackView {
    public func configure(with data: [ViewModelProtocol]) {
        subviews.forEach { $0.removeFromSuperview() }
        
        let views = data.map { $0.loadView() }
        
        views.forEach { addArrangedSubview($0) }
    }
}

extension ViewModelProtocol {
    func loadView() -> UIView {
        let view: UIView = view.init()

        if let presenting = view as? Rendering {
            presenting.configureWithValue(self)
        }
        return view
    }
}
