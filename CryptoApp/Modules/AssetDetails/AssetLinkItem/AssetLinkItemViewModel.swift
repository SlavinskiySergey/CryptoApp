//
//  AssetLinkItemViewModel.swift
//  CryptoApp
//

import Foundation
import RxSwift
import Components
import Models

struct AssetLinkItemViewModel: AssetLinkItemViewData {
    let tableCell = AssetLinkItemView.tableCell
    let view = AssetLinkItemView.view
    
    let didSelect: Observable<URL>
    private let actionSubject = PublishSubject<Void>()
    
    let title: String
    
    init(link: Link) {
        self.title = link.title
        self.didSelect = actionSubject.compactMap { URL(string: link.url) }
    }
    
    func onAction() {
        actionSubject.onNext(())
    }
}
