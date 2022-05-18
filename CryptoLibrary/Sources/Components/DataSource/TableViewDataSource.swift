//
//  TableViewDataSource.swift
//  Components
//

import UIKit

public protocol TableViewDataSourceProtocol {
    var sectionViewModels: [TableSectionViewModelProtocol] { get set }
}

public final class TableViewDataSource: NSObject, TableViewDataSourceProtocol {
    public var sectionViewModels: [TableSectionViewModelProtocol] = []
    
    weak var tableView: UITableView?
        
    private var reuseIdentifiers: Set<String> = []
    
    public init(tableView: UITableView) {
        self.tableView = tableView
        super.init()
        
        configure(tableView: tableView)
    }
    
    private func configure(tableView: UITableView) {
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.estimatedSectionHeaderHeight = 120
        tableView.estimatedRowHeight = 120
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedSectionFooterHeight = 120
        
        tableView.tableFooterView = UIView(frame: .zero)
    }
}

// MARK: UITableViewDataSource
extension TableViewDataSource: UITableViewDataSource {
    public func numberOfSections(in tableView: UITableView) -> Int {
        return sectionViewModels.count
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let section = sectionViewModels[safe: section] else {
            return .zero
        }
        return section.tableItems.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewModel = sectionViewModels[indexPath.section].tableItems[indexPath.row]
        
        let reuseIdentifier = viewModel.reuseIdentifier
        if !reuseIdentifiers.contains(reuseIdentifier) {
            tableView.register(viewModel: viewModel)
            reuseIdentifiers.insert(reuseIdentifier)
        }
        
        let tableCell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        
        if let cell = tableCell as? TableCellProtocol {
            cell.configureWithValue(viewModel)
        }
        
        tableCell.selectionStyle = .none
        
        return tableCell
    }
}

// MARK: UITableViewDelegate
extension TableViewDataSource: UITableViewDelegate {
    public func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let section = sectionViewModels[safe: indexPath.section],
                let viewModel = section.tableItems[safe: indexPath.row],
                let tableCell = cell as? TableCellProtocol else {
            return
        }
        tableCell.willDisplay(viewModel)
    }
    
    public func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let section = sectionViewModels[safe: indexPath.section],
                let viewModel = section.tableItems[safe: indexPath.row],
                let tableCell = cell as? TableCellProtocol else {
            return
        }
        tableCell.didEndDisplay(viewModel)
    }
    
    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        guard sectionViewModels[safe: section]?.header != nil else {
            return 0
        }
        return UITableView.automaticDimension
    }
    
    public func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        guard sectionViewModels[safe: section]?.footer != nil else {
            return 0
        }
        return UITableView.automaticDimension
    }
}


private extension RandomAccessCollection {
    /// Returns the element at the specified index if it is within bounds, otherwise nil.
    /// - complexity: O(1)
    subscript (safe index: Index) -> Element? {
        guard index >= startIndex, index < endIndex else {
            return nil
        }
        return self[index]
    }
}
