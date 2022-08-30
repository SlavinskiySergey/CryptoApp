//
//  AssetDetailsViewController.swift
//  CryptoApp
//

import UIKit
import RxSwift
import Components

final class AssetDetailsViewController: UIViewController {
    private let viewModel: AssetDetailsViewModelProtocol
    
    private lazy var tableView = UITableView()
    
    private lazy var activityIndicator = UIActivityIndicatorView(style: .large)
    
    private lazy var dataSource: TableViewDataSourceProtocol = TableViewDataSource(tableView: tableView)
        
    private let bag = DisposeBag()
    
    init(viewModel: AssetDetailsViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        applyDesign()
        applyConstraints()
        
        viewStateSubscription()
        viewModel.viewIsReady()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: nil, style: .plain, target: self, action: #selector(changeTheme))
        setupRightBarButtonItem()
    }
    
    private func applyDesign() {
        view.backgroundPalette = Palette.backgroundContentColor
        activityIndicator.colorPalette = Palette.tintColor
        
        tableView.backgroundPalette = Palette.backgroundPageColor
        tableView.separatorColorPalette = Palette.separatorColor
    }
    
    private func applyConstraints() {
        view.fillWith(tableView)
        
        view.addSubview(
            activityIndicator,
            constraints: [
                equal(\.centerXAnchor),
                equal(\.centerYAnchor)
            ])
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
    
    private func dataSubscription(_ data: AssetDetailsDataProtocol) {
        dataSource.sectionViewModels = data.sections
        tableView.reloadData()
    }
    
    @objc
    private func changeTheme() {
        ThemeSwitcher.chooseNextTheme()
        setupRightBarButtonItem()
        if (!(tableView.isTracking || tableView.isDragging || tableView.isDecelerating)) {
            ThemeSwitcher.animateThemeChange()
        }
    }

    private func setupRightBarButtonItem() {
        navigationItem.rightBarButtonItem?.title = "\(ThemeSwitcher.nextThemeName) theme"
    }
}
