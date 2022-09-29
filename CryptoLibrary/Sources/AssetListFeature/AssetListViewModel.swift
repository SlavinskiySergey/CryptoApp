//
//  AssetListViewModel.swift
//  CryptoApp
//

import Foundation
import RxSwift
import RxCocoa
import ClientNetworkService
import Models
import Module

protocol AssetListViewModelProtocol: AnyObject {
    var viewState: Driver<ViewState<AssetListDataProtocol>> { get }
    func viewIsReady()
}

final class AssetListViewModel {
    var isLoading: Bool = false
    
    var modelList = List<Asset>()
    
    var pageLoadDisposable: Disposable?
    
    let modelSubject = BehaviorSubject<ViewState<List<Asset>>>(value: .loading)
    
    weak var coordinator: AssetListCoordinatorProtocol?
    
    private let clientNetworkService: ClientNetworkServiceAsset
    
    private let viewStateSubject = BehaviorSubject<ViewState<AssetListDataProtocol>>(value: .loading)
            
    private let bag = DisposeBag()
    
    private var dataBag = DisposeBag()
    
    init(clientNetworkService: ClientNetworkServiceAsset) {
        self.clientNetworkService = clientNetworkService
        
        reload()
    }
                
    private func viewStateCreation(assetsState: ViewState<List<Asset>>) {
        switch assetsState {
        case .loading:
            viewStateSubject.onNext(.loading)
        case .data(let list):
            dataCreation(assets: list)
        case .error(let error):
            viewStateSubject.onNext(.error(error))
        }
    }
    
    private func dataCreation(assets: List<Asset>) {
        dataBag = DisposeBag()
        
        let data = AssetListData(assets: assets)
        
        data.didSelectAsset
            .bind { [weak self] in
                self?.coordinator?.openDetails(asset: $0)
            }
            .disposed(by: dataBag)
        
        data.loadMoreAction?
            .bind { [weak self] in
                self?.loadMore()
            }
            .disposed(by: dataBag)
        
        viewStateSubject.onNext(.data(data))
    }
}

extension AssetListViewModel: AssetListViewModelProtocol {
    var viewState: Driver<ViewState<AssetListDataProtocol>> {
        viewStateSubject.asDriver(onErrorJustReturn: .loading)
    }
    
    func viewIsReady() {
        modelSubject
            .bind { [weak self] in
                self?.viewStateCreation(assetsState: $0)
            }
            .disposed(by: bag)
    }
}

extension AssetListViewModel: PageLoadable {
    typealias Model = Asset
    
    func listObservable(page: Int) -> Observable<List<Asset>> {
        clientNetworkService.assets(page: page)
    }
}
