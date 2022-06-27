//
//  LoadingIndicatorViewModel.swift
//  Components
//

import Foundation
import RxSwift

public struct LoadingIndicatorViewModel: LoadingIndicatorViewData {
    public let tableCell = LoadingIndicatorView.tableCell
    public let view = LoadingIndicatorView.view
    
    public let willDisplay: Observable<()>
    private let willDisplaySubject = PublishSubject<()>()
    
    public init() {
        self.willDisplay = willDisplaySubject
    }
    
    func onWillDisplay() {
        willDisplaySubject.onNext(())
    }
}
