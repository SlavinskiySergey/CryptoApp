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
    var didSelectSubject: PublishSubject<Void> { get }
}

extension ActionableItem {
    public var didSelect: Observable<Void> {
        didSelectSubject.asObservable()
    }
}
