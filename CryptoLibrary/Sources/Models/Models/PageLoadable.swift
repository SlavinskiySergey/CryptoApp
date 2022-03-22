//
//  PageLoadable.swift
//  Models
//

import Foundation
import RxSwift

public protocol PageLoadable: AnyObject {
    associatedtype Model
    
    var isLoading: Bool { get set }
    
    var modelList: List<Model> { get set }
    
    var pageLoadDisposable: Disposable? { get set }
    
    var modelSubject: BehaviorSubject<ViewState<List<Model>>> { get }
    
    func listObservable(page: Int) -> Observable<List<Model>>
}

extension PageLoadable {
    public func loadMore() {
        load(clean: false)
    }
    
    public func reload() {
        load(clean: true)
    }
    
    private func load(clean: Bool)  {
        guard clean || !isLoading else {
            return
        }
        isLoading = true
        
        if clean {
            modelList.reset()
        }
        let page = modelList.page + 1
        
        pageLoadDisposable?.dispose()
        pageLoadDisposable = listObservable(page: page)
            .subscribe { [weak self] event in
                switch event {
                case .next(let list):
                    self?.loaded(page: page, list: list)
                case .error(let error):
                    self?.modelSubject.onNext(.error(error))
                case .completed:
                    break
                }
                self?.isLoading = false
        }
    }
    
    private func loaded(page: Int, list: List<Model>) {
        modelList += list
        modelSubject.onNext(.data(modelList))
    }
}
