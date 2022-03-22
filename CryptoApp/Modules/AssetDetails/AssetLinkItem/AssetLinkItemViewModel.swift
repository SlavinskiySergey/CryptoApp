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
    
    let actionSubject = PublishSubject<Void>()
    let didSelect: Observable<URL>
    
    let title: String
    
    init(link: Link) {
        self.title = link.title
        self.didSelect = actionSubject.compactMap { URL(string: link.url) }
    }
}
