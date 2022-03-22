//
//  AssetDetailsItemViewModel.swift
//  CryptoApp
//

import Foundation
import Components
import Models

struct AssetDetailsItemViewModel: AssetDetailsItemViewData {
    let tableCell = AssetDetailsItemView.tableCell
    let view = AssetDetailsItemView.view
    
    let name: String
    let symbol: String?
    let price: String?
    let tagline: String?
    
    init(assetDetails: AssetDetails) {
        self.name = assetDetails.name
        self.symbol = assetDetails.symbol
        self.price = assetDetails.displayPriceUsd
        self.tagline = assetDetails.tagline
    }
}
