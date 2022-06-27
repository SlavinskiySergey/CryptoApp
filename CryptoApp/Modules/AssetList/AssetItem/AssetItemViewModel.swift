//
//  AssetItemViewModel.swift
//  CryptoApp
//

import Foundation
import RxSwift
import Components
import Models

struct AssetItemViewModel: AssetItemViewData {
    let tableCell = AssetItemView.tableCell
    let view = AssetItemView.view
    
    let didSelect: Observable<Void>
    private let didSelectSubject = PublishSubject<Void>()
    
    let name: String
    let symbol: String?
    let price: String?
    
    init(asset: Asset) {
        self.didSelect = didSelectSubject
        
        self.name = asset.name
        self.symbol = asset.symbol
        self.price = asset.displayPriceUsd
    }
    
    func onDidSelect() {
        didSelectSubject.onNext(())
    }
}
