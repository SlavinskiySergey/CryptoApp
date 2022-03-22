//
//  NetworkService+Extensions.swift
//  NetworkService
//

import Foundation
import RxSwift

extension NetworkService {
    public func call<E: Endpoint>(endpoint: E) -> Observable<E.Value> {
        Observable.create { [weak self] observer in
            let cancellable = self?.send(endpoint: endpoint) { result in
                switch result {
                case .success(let value):
                    observer.onNext(value)
                    observer.onCompleted()
                case .failure(let error):
                    observer.onError(error)
                }
            }
            
            return Disposables.create {
                cancellable?()
            }
        }
    }
}
