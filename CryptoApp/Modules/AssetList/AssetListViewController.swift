//
//  AssetListViewController.swift
//  CryptoApp
//

import UIKit
import RxSwift
import Components

final class AssetListViewController: UIViewController {
    private let viewModel: AssetListViewModelProtocol
    
    private lazy var tableView = UITableView()
    
    private lazy var activityIndicator = UIActivityIndicatorView(style: .large)
    
    private lazy var dataSource: TableViewDataSourceProtocol = TableViewDataSource(tableView: tableView)
    
    private let bag = DisposeBag()
    
    init(viewModel: AssetListViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        applyConstraints()
        viewStateSubscription()
        viewModel.viewIsReady()
    }
    
    private func applyConstraints() {
        view.addSubview(
            activityIndicator,
            constraints: [
                equal(\.centerXAnchor),
                equal(\.centerYAnchor)
            ])
        
        view.fillWith(tableView)
    }
    
    private func viewStateSubscription() {
        viewModel.viewState
            .drive(onNext: { [weak self] viewState in
                self?.activityIndicator.apply(state: viewState)
                self?.tableView.isHidden = viewState.contentHidden
                
                switch viewState {
                case .data(let data):
                    self?.dataSubscription(data)
                case .loading:
                    break
                case .error(let error):
                    self?.show(error: error)
                }
            })
            .disposed(by: bag)
    }
    
    private func dataSubscription(_ data: AssetListDataProtocol) {
        dataSource.sectionViewModels = data.sections
        tableView.reloadData()
    }
}
