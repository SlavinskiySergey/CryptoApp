//
//  HTMLItemView.swift
//  Components
//

import UIKit
import RxSwift

protocol HTMLItemViewData: ViewModelProtocol, TableItemViewModelProtocol {
    var aboutAttributedText: NSAttributedString { get }
    
    func onDidSelect(url: URL)
}

final class HTMLItemView: UIView, ReusableView {
    private var data: HTMLItemViewData?
    
    private lazy var textView: UITextView = {
        let textView = UITextView()
        textView.textColorPalette = Palette.tintColor
        textView.backgroundPalette = Palette.backgroundContentColor
        textView.isScrollEnabled = false
        textView.isEditable = false
        textView.delegate = self
        textView.linkTextAttributes = [
            .foregroundColor : UIColor.blue
        ]
        return textView
    }()
    
    init() {
        super.init(frame: .zero)
        
        backgroundPalette = Palette.backgroundContentColor
                
        addSubview(textView, layout: .insets(16))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func prepareForReuse() {}
}

// MARK: - Renderable
extension HTMLItemView: Renderable {
    func configure(with data: HTMLItemViewData) {
        self.data = data
        textView.attributedText = data.aboutAttributedText
    }
}

extension HTMLItemView: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        switch interaction {
        case .preview, .presentActions:
            return true
        case .invokeDefaultAction:
            data?.onDidSelect(url: URL)
            return false
        @unknown default:
            return false
        }
    }
}
