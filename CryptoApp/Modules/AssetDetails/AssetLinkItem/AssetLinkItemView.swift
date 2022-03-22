//
//  AssetLinkItemView.swift
//  CryptoApp
//

import UIKit
import RxSwift
import Components

protocol AssetLinkItemViewData: ViewModelProtocol, TableItemViewModelProtocol {
    var actionSubject: PublishSubject<Void> { get }
    var title: String { get }
}

final class AssetLinkItemView: UIView, ReusableView {
    private var bag = DisposeBag()
    
    private lazy var actionButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(.blue, for: [.normal, .highlighted])
        return button
    }()
    
    init() {
        super.init(frame: .zero)
        
        addSubview(actionButton, layout: .insets(16))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func prepareForReuse() {
        bag = DisposeBag()
    }
}

// MARK: - Presentable
extension AssetLinkItemView: Renderable {
    func configure(with data: AssetLinkItemViewData) {
        actionButton.setTitle(data.title, for: .normal)
        actionButton.setTitle(data.title, for: .highlighted)
        
        actionButton.rx.tap
            .bind(to: data.actionSubject)
            .disposed(by: bag)
    }
}
