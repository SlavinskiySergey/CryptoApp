//
//  ChartItemView.swift
//  CryptoApp
//

import UIKit
import Charts
import Components

protocol ChartItemViewData: ViewModelProtocol, TableItemViewModelProtocol {
    var dataSet: DataSet { get }
}

final class ChartItemView: UIView, ReusableView {
    private lazy var chartView = ChartView(insets: UIEdgeInsets(top: 32, left: 16, bottom: 0, right: 16),
                                           yCalculator: SumYCalculator(),
                                           chartRenderer: StackedBarChartRenderer(),
                                           legendXRenderer: FloatingLegendXRenderer(),
                                           legendYRenderer: FloatingLegendYRenderer(valuesCount: 7, showsTopValue: false),
                                           detailsEnabled: true)
    
    init() {
        super.init(frame: .zero)
        
        addSubview(chartView,
                   constraints: [
                    equal(\.topAnchor),
                    equal(\.bottomAnchor, constant: -16),
                    equal(\.leadingAnchor),
                    equal(\.trailingAnchor),
                    equal(\.heightAnchor, constant: 256, priority: .defaultHigh)
                   ]
        )
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func prepareForReuse() {
    }
}

// MARK: - Renderable
extension ChartItemView: Renderable {
    func configure(with data: ChartItemViewData) {
        chartView.setDataSet(data.dataSet)
    }
}
