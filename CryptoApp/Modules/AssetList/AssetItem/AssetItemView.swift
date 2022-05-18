//
//  AssetItemView.swift
//  CryptoApp
//

import UIKit
import RxSwift
import Components

protocol AssetItemViewData: ViewModelProtocol, TableItemViewModelProtocol, ActionableItem {
    var name: String { get }
    var symbol: String? { get }
    var price: String? { get }
}

final class AssetItemView: UIView, ReusableView {
    private var bag = DisposeBag()
    
    private lazy var tapGesture = UITapGestureRecognizer()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    private lazy var symbolLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 18)
        label.textAlignment = .right
        return label
    }()
    
    init() {
        super.init(frame: .zero)
        
        addGestureRecognizer(tapGesture)
        
        nameLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        symbolLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        priceLabel.setContentHuggingPriority(.defaultLow, for: .horizontal)
        
        let stackView = UIStackView(arrangedSubviews: [nameLabel, symbolLabel, priceLabel])
        stackView.spacing = 4
        
        addSubview(stackView, layout: .insets(16))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func prepareForReuse() {
        bag = DisposeBag()
    }
}

// MARK: - Renderable
extension AssetItemView: Renderable {
    func configure(with data: AssetItemViewData) {
        nameLabel.text = data.name
        symbolLabel.text = data.symbol
        priceLabel.text = data.price
        
        tapGesture.rx.event
            .bind(onNext: { _ in
                data.didSelectSubject.onNext(())
            })
            .disposed(by: bag)
    }
}
