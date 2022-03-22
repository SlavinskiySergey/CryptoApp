//
//  AssetDetailsData.swift
//  CryptoApp
//

import Foundation
import RxSwift
import Components
import Models

protocol AssetDetailsDataProtocol {
    var sections: [TableSectionViewModelProtocol] { get }
}

struct AssetDetailsData: AssetDetailsDataProtocol {
    let didSelect: Observable<URL>
    
    let tableItems: [TableItemViewModelProtocol]
    
    init(assetDetails: AssetDetails, chartDataSet: ChartDataSet?) {
        let htmlItem = assetDetails.details.flatMap(HTMLItemViewModel.init)
                
        let links = assetDetails.links.map(AssetLinkItemViewModel.init)
        
        let didSelectSources = links.map { $0.didSelect } + [htmlItem?.didSelect].compactMap { $0 }
        
        self.didSelect = Observable.merge(didSelectSources)
        
        let items: [TableItemViewModelProtocol?] = [
            AssetDetailsItemViewModel(assetDetails: assetDetails),
            htmlItem,
            chartDataSet.map { ChartItemViewModel(asset: assetDetails, chartDataSet: $0) }
        ] + links
        
        self.tableItems = items.compactMap { $0 }
    }
}

extension AssetDetailsData: TableSectionViewModelProtocol {
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
