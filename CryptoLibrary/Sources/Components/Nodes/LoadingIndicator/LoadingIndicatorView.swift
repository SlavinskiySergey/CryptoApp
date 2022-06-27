//
//  LoadingIndicatorView.swift
//  Components
//

import UIKit
import RxSwift

protocol LoadingIndicatorViewData: ViewModelProtocol, TableItemViewModelProtocol {
    func onWillDisplay()
}

final class LoadingIndicatorView: UIView, ReusableView, ComponentProtocol {
    private lazy var activityIndicator = UIActivityIndicatorView(style: .large)
        
    private var bag = DisposeBag()
    
    init() {
        super.init(frame: .zero)
        
        addSubview(
            activityIndicator,
            constraints: [
                equal(\.topAnchor),
                equal(\.bottomAnchor),
                equal(\.centerXAnchor),
                equal(\.centerYAnchor)
            ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func prepareForReuse() {
        bag = DisposeBag()
    }
}

// MARK: - Renderable
extension LoadingIndicatorView: Renderable {
    func configure(with data: LoadingIndicatorViewData) {}
    
    func willBeShown(with data: LoadingIndicatorViewData) {
        activityIndicator.startAnimating()
        data.onWillDisplay()
    }
    
    func wasHidden(with data: LoadingIndicatorViewData) {
        activityIndicator.stopAnimating()
    }
}
