//
//  ReusableView.swift
//  Components
//

import UIKit

public protocol ReusableView: AnyViewClass, Renderable, ComponentProtocol {
    static var tableCell: AnyTableCellClass.Type { get }

    static var view: AnyViewClass.Type { get }
    
    func prepareForReuse()
}

extension ReusableView {
    public static var tableCell: AnyTableCellClass.Type {
        return ContainerTableCell<Self>.self
    }
        
    public static var view: AnyViewClass.Type {
        return Self.self
    }
}
