//
//  HTMLItemView.swift
//  Components
//

import UIKit
import RxSwift

protocol HTMLItemViewData: ViewModelProtocol, TableItemViewModelProtocol {
    var didSelectSubject: PublishSubject<URL> { get }
    var aboutAttributedText: NSAttributedString { get }
}

final class HTMLItemView: UIView, ReusableView {
    private var didSelectSubject: PublishSubject<URL>?
    
    private lazy var textView: UITextView = {
        let textView = UITextView()
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
        didSelectSubject = data.didSelectSubject
        textView.attributedText = data.aboutAttributedText
    }
}

extension HTMLItemView: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        switch interaction {
        case .preview, .presentActions:
            return true
        case .invokeDefaultAction:
            didSelectSubject?.onNext(URL)
            return false
        @unknown default:
            return false
        }
    }
}
