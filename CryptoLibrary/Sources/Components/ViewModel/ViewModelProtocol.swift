//
//  ViewModelProtocol.swift
//  Components
//

import UIKit
import RxSwift

public protocol ViewModelProtocol {
    var view: AnyViewClass.Type { get }
}

public protocol AnyViewClass: UIView {}

public protocol ActionableItem {
    var didSelect: Observable<Void> { get }
    
    func onDidSelect()
}
