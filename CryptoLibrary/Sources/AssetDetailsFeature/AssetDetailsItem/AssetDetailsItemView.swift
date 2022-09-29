//
//  AssetDetailsItemView.swift
//  CryptoApp
//

import UIKit
import Components

protocol AssetDetailsItemViewData: ViewModelProtocol, TableItemViewModelProtocol {
    var name: String { get }
    var symbol: String? { get }
    var price: String? { get }
    var tagline: String? { get }
}

final class AssetDetailsItemView: UIView, ReusableView {
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textColorPalette = Palette.tintColor
        label.font = UIFont.boldSystemFont(ofSize: 30)
        return label
    }()
    
    private lazy var symbolLabel: UILabel = {
        let label = UILabel()
        label.textColorPalette = Palette.titleColor
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.textColorPalette = Palette.tintColor
        label.font = UIFont.systemFont(ofSize: 24)
        return label
    }()
    
    private lazy var taglineLabel: UILabel = {
        let label = UILabel()
        label.textColorPalette = Palette.titleColor
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .right
        return label
    }()
        
    init() {
        super.init(frame: .zero)
        
        backgroundPalette = Palette.backgroundContentColor
        
        let topStackView = UIStackView(arrangedSubviews: [nameLabel, symbolLabel])
        topStackView.spacing = 8
        topStackView.alignment = .lastBaseline
        
        let stackView = UIStackView(arrangedSubviews: [
            topStackView,
            priceLabel,
            taglineLabel
        ])
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 8
        
        addSubview(stackView, layout: .insets(16))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func prepareForReuse() {}
}

// MARK: - Renderable
extension AssetDetailsItemView: Renderable {
    func configure(with data: AssetDetailsItemViewData) {
        nameLabel.text = data.name
        symbolLabel.text = data.symbol
        priceLabel.text = data.price
        taglineLabel.text = data.tagline
    }
}
