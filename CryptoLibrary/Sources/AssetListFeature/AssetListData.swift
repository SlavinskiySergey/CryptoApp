//
//  AssetListData.swift
//  CryptoApp
//

import Foundation
import RxSwift
import Components
import Models

protocol AssetListDataProtocol {
    var sections: [TableSectionViewModelProtocol] { get }
}

struct AssetListData: AssetListDataProtocol {
    let didSelectAsset: Observable<Asset>
    var loadMoreAction: Observable<()>?
    
    let tableItems: [TableItemViewModelProtocol]
    
    init(assets: List<Asset>) {
        var assetItems: [AssetItemViewModel] = []
        var assetActions: [Observable<Asset>] = []
        assets.items.forEach { asset in
            let item = AssetItemViewModel(asset: asset)
            assetItems.append(item)
            assetActions.append(item.didSelect.map { _ in asset })
        }
        
        self.didSelectAsset = Observable.merge(assetActions)

        var items: [TableItemViewModelProtocol] = assetItems
        
        if assets.hasMore {
            let item = LoadingIndicatorViewModel()
            items.append(item)
            self.loadMoreAction = item.willDisplay
        }
        
        self.tableItems = items
    }
}

extension AssetListData: TableSectionViewModelProtocol {
    var sections: [TableSectionViewModelProtocol] {
       [self]
    }
    var header: TableHeaderFooterViewModelProtocol? {
        nil
    }
    var footer: TableHeaderFooterViewModelProtocol? {
        nil
    }
}
