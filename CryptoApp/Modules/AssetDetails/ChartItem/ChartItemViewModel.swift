//
//  ChartItemViewModel.swift
//  CryptoApp
//

import CoreGraphics
import Components
import Models
import Charts

struct ChartItemViewModel: ChartItemViewData {
    let tableCell = ChartItemView.tableCell
    let view = ChartItemView.view
    
    let dataSet: DataSet
        
    init(asset: Asset, chartDataSet: ChartDataSet) {
        let channel = Channel(name: asset.name,
                              color: .systemBlue,
                              values: chartDataSet.values.map { CGFloat($0) })
        
        self.dataSet = DataSet(channels: [channel],
                               timestamps: chartDataSet.timestamps,
                               percentage: false,
                               stacked: false,
                               yScaled: false)
    }
}
