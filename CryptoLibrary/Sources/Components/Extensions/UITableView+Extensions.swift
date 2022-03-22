//
//  UITableView+Extensions.swift
//  Components
//

import UIKit

extension UITableView {
    func register(viewModel: TableItemViewModelProtocol) {
        register(viewModel.tableCell, forCellReuseIdentifier: viewModel.reuseIdentifier)
    }
}
