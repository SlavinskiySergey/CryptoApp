//
//  AssetDetailsViewModel.swift
//  CryptoApp
//

import Foundation
import RxSwift
import RxCocoa
import ClientNetworkService
import Models

protocol AssetDetailsViewModelProtocol: AnyObject {
    var viewState: Driver<ViewState<AssetDetailsDataProtocol>> { get }
    func viewIsReady()
}

final class AssetDetailsViewModel {
    weak var coordinator: AssetDetailsCoordinatorProtocol?
    
    private let asset: Asset
    
    private let clientNetworkService: ClientNetworkServiceAsset
    
    private let assetDetailsSubject: BehaviorSubject<AssetDetails>
    
    private let chartDataSetSubject = BehaviorSubject<ChartDataSet?>(value: nil)
    
    private let viewStateSubject = BehaviorSubject<ViewState<AssetDetailsDataProtocol>>(value: .loading)
    
    private let bag = DisposeBag()
    
    private var dataBag = DisposeBag()
        
    init(
        asset: Asset,
        clientNetworkService: ClientNetworkServiceAsset)
    {
        self.asset = asset
        self.clientNetworkService = clientNetworkService
        self.assetDetailsSubject = BehaviorSubject(value: AssetDetailsModel(asset: asset))
        
        loadData()
    }
    
    private func loadData() {
        clientNetworkService.assetDetails(for: asset)
            .subscribe(onNext: { [weak self] in
                self?.assetDetailsSubject.onNext($0)
            })
            .disposed(by: bag)
        
        clientNetworkService.chartDataSet(for: asset)
            .subscribe(onNext: { [weak self] in
                self?.chartDataSetSubject.onNext($0)
            })
            .disposed(by: bag)
    }
    
    private func viewStateCreation(assetDetails: AssetDetails, chartDataSet: ChartDataSet?) {
        dataBag = DisposeBag()
        
        let data = AssetDetailsData(assetDetails: assetDetails, chartDataSet: chartDataSet)
        
        data.didSelect
            .bind { [weak self] in
                self?.coordinator?.openWebView(url: $0)
            }
            .disposed(by: dataBag)
        
        viewStateSubject.onNext(.data(data))
    }
}

extension AssetDetailsViewModel: AssetDetailsViewModelProtocol {
    var viewState: Driver<ViewState<AssetDetailsDataProtocol>> {
        viewStateSubject.asDriver(onErrorJustReturn: .loading)
    }
    
    func viewIsReady() {
        Observable.combineLatest(assetDetailsSubject, chartDataSetSubject)
            .bind { [weak self] assetDetails, chartDataSet in
                self?.viewStateCreation(assetDetails: assetDetails, chartDataSet: chartDataSet)
            }
            .disposed(by: bag)
    }
}
