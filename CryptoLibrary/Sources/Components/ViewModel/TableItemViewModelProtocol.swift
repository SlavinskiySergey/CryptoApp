//
//  TableItemViewModelProtocol.swift
//  Components
//

import Foundation

public protocol TableItemViewModelProtocol {
    var tableCell: AnyTableCellClass.Type { get }
}

extension TableItemViewModelProtocol {
    var reuseIdentifier: String {
        String(describing: tableCell)
    }
}
