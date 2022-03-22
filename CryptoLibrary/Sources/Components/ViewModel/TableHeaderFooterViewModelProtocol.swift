//
//  TableHeaderFooterViewModelProtocol.swift
//  Components
//

import UIKit

public protocol AnyTableHeaderFooterViewClass: UITableViewHeaderFooterView {}

public protocol TableHeaderFooterViewModelProtocol {
    var classType: AnyTableHeaderFooterViewClass.Type { get }
}
