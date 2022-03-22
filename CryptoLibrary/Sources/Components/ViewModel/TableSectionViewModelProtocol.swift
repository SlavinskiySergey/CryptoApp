//
//  TableSectionViewModelProtocol.swift
//  Components
//

import Foundation

public protocol TableSectionViewModelProtocol {
    var header: TableHeaderFooterViewModelProtocol? { get }
    
    var tableItems: [TableItemViewModelProtocol] { get }
    
    var footer: TableHeaderFooterViewModelProtocol? { get }
}
