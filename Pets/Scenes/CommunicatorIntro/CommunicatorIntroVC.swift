//
//  CommunicatorIntroVC.swift
//  Pets
//
//  Created by Seven on 2022/8/14.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources

class CommunicatorIntroVC: UIViewController {

    private enum Constants {
        static let backgroundColor = UIColor.background
    }
    
    // MARK: - Properties
    
    private let vm: CommunicatorIntroVM
    private let bag = DisposeBag()
    
    // MARK: - Views
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        // TODO: - Update cell identifier
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.backgroundColor = Constants.backgroundColor
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        
        return tableView
    }()
    
    // MARK: - Initializers
    
    init(vm: CommunicatorIntroVM) {
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
        bindViewModel()
    }
    
    // MARK: - Setups
    
    private func setupViews() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { $0.edges.equalToSuperview() }
        
        let sections: [CommunicatorIntroSectionModel] = [
            .intro(title: "總覽", items: [
                .introItem(intro: CommunicatorIntro(title: "教學風格", subtitle: "熟悉國文")),
                .introItem(intro: CommunicatorIntro(title: "教學風格", subtitle: "熟悉國文")),
                .introItem(intro: CommunicatorIntro(title: "教學風格", subtitle: "熟悉國文")),
                .introItem(intro: CommunicatorIntro(title: "教學風格", subtitle: "熟悉國文")),
                .introItem(intro: CommunicatorIntro(title: "教學風格", subtitle: "熟悉國文"))
            ]),
            .lesson(title: "開設課程", items: [
                .lessonItem(lesson: Lesson(title: "國二", name: "英文")),
                .lessonItem(lesson: Lesson(title: "國二", name: "英文")),
                .lessonItem(lesson: Lesson(title: "國二", name: "英文")),
                .lessonItem(lesson: Lesson(title: "國二", name: "英文")),
                .lessonItem(lesson: Lesson(title: "國二", name: "英文")),
                .lessonItem(lesson: Lesson(title: "國二", name: "英文")),
                .lessonItem(lesson: Lesson(title: "國二", name: "英文")),
                .lessonItem(lesson: Lesson(title: "國二", name: "英文")),
                .lessonItem(lesson: Lesson(title: "國二", name: "英文")),
                .lessonItem(lesson: Lesson(title: "國二", name: "英文")),
                .lessonItem(lesson: Lesson(title: "國二", name: "最後"))
            ])
        ]
        
        let dataSource = RxTableViewSectionedReloadDataSource<CommunicatorIntroSectionModel>(
            configureCell: { dataSource, tableView, indexPath, element in
                let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
                switch dataSource[indexPath] {
                case .introItem(let intro):
                    cell.textLabel?.text = intro.subtitle
                case .lessonItem(let lesson):
                    cell.textLabel?.text = lesson.name
                }
                cell.backgroundColor = Constants.backgroundColor
                return cell
            }
        )
        
        dataSource.titleForHeaderInSection = { dataSource, index in
            dataSource.sectionModels[index].title
        }
        
        Observable.just(sections)
            .bind(to: tableView.rx.items(dataSource: dataSource))
            .disposed(by: bag)
    }
    
    private func bindViewModel() {
        
    }
}

