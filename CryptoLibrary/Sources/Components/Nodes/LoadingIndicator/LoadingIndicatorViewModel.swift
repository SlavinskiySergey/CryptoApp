//
//  LoadingIndicatorViewModel.swift
//  Components
//

import Foundation
import RxSwift

public struct LoadingIndicatorViewModel: LoadingIndicatorViewData {
    public let tableCell = LoadingIndicatorView.tableCell
    public let view = LoadingIndicatorView.view
    
    let willDisplaySubject = PublishSubject<()>()
    
    public var willDisplay: Observable<()> {
        willDisplaySubject
    }
    
    public init() {}
}
