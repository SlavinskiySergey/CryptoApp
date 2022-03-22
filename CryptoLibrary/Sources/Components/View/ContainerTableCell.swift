//
//  ContainerTableCell.swift
//  Components
//

import UIKit

public protocol AnyTableCellClass: UITableViewCell {}

final class ContainerTableCell<ViewType: ReusableView>: UITableViewCell, AnyTableCellClass, TableCellProtocol {
    let view: ViewType
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        view = ViewType()
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.fillWith(view)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        view.prepareForReuse()
    }
}

// MARK: - Renderable
extension ContainerTableCell: Renderable {
    func configure(with data: ViewType.ViewData) {
        view.configure(with: data)
    }
    
    func willBeShown(with data: ViewType.ViewData) {
        view.willBeShown(with: data)
    }
    
    func wasHidden(with data: ViewType.ViewData) {
        view.wasHidden(with: data)
    }
}
