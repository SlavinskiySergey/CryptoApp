//
//  HTMLItemViewModel.swift
//  Components
//

import UIKit
import RxSwift

public struct HTMLItemViewModel: HTMLItemViewData {
    public let tableCell = HTMLItemView.tableCell
    public let view = HTMLItemView.view
    
    public let didSelect: Observable<URL>
    let didSelectSubject = PublishSubject<URL>()
    
    let aboutAttributedText: NSAttributedString
    
    public init?(text: String?) {
        guard
            let text = text,
            let attributedString = try? NSAttributedString(
                data: Data(text.utf8),
                options: [.documentType : NSAttributedString.DocumentType.html],
                documentAttributes: nil
            ) else {
                return nil
            }
        
        let formatted = NSMutableAttributedString(attributedString: attributedString)
        formatted.addAttributes([
                    .font : UIFont.systemFont(ofSize: 16),
                    .foregroundColor: UIColor.darkGray
        ],
                  range: NSRange.init(location: 0, length: attributedString.length))
        
        self.didSelect = didSelectSubject.asObservable()
        
        self.aboutAttributedText = formatted
    }
}
