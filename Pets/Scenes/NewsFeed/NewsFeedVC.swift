//
//  NewsFeedVC.swift
//  Pets
//
//  Created by Seven on 2022/7/17.
//

import UIKit
import SnapKit
import RxSwift

final class NewsFeedVC: UIViewController {

    // MARK: - Properties
    
    private let vm: NewsFeedVM
    private let bag = DisposeBag()
    // MARK: - Views
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(NewsFeedTableCell.self, forCellReuseIdentifier: NewsFeedTableCell.identifier)
        tableView.showsVerticalScrollIndicator = false
        
        return tableView
    }()

    // MARK: - Initializers
    
    init(vm: NewsFeedVM) {
        self.vm = vm
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @available(*, unavailable)
    init() {
        fatalError("init() has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        bindVM()
        
        vm.fetchFeeds()
    }
    
    // MARK: - Setups
    
    private func setupViews() {
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    // MARK: - Bindings
    
    private func bindVM() {
        vm.state.feeds
            .drive(tableView.rx.items(cellIdentifier: NewsFeedTableCell.identifier)) { index, feed, cell in
            }
        .disposed(by: bag)
    }
}
