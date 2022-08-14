//
//  CommunicatorDetailVC.swift
//  Pets
//
//  Created by Seven on 2022/8/7.
//

import UIKit
import RxSwift

class CommunicatorDetailVC: UIViewController {
    
    private enum Constants {
        static let backgroundColor = UIColor.background
        static let screenSize = UIScreen.main.bounds
        static let imageSize = CGSize(width: screenSize.width, height: screenSize.width)
        static let stackViewInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 35.0, right: 0.0)

        static let profileCardStackViewBackgroundColor = UIColor.white
        static let profileCardStackViewMargins = UIEdgeInsets(horizontalInsets: 10.0, verticalInsets: 15.0)
        static let profileCardStackViewInsets = UIEdgeInsets(top: 0.0, left: 10.0, bottom: 0.0, right: 10.0)
        static let profileCardStackViewTopOffset = -10.0
        static let profileCardStackViewSpacing = 7.0
        static let profileCardStackViewHeight = 100.0
        static let profileCardStackViewRadius = 7.0
        
        static let tagViewColor = UIColor.systemBlue
        static let tagViewRadius = 5.0
        static let buttonBarViewBackgroundColor = UIColor.background

        static let menuViewInsets = UIEdgeInsets(insets: 10.0)
        static let menuViewBackgroundColor = UIColor.clear
        static let menuViewTintColor = UIColor.black
        static let introViewInsets = UIEdgeInsets(top: 0.0, left: 10.0, bottom: 0.0, right: 10.0)
    }
    
    // MARK: - Properties
    
    private let vm : CommunicatorDetailVM
    private let bag = DisposeBag()
    
    // MARK: - Views
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        scrollView.delegate = self
        return scrollView
    }()
    
    private let stackView = UIStackView()
    
    private lazy var headImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    
    private lazy var headView: UIView = {
        let view = UIView()
        view.addSubview(headImageView)
        headImageView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(headImageView.snp.width)
        }
        
        view.addSubview(profileCardStackView)
        profileCardStackView.snp.makeConstraints {
            $0.top.equalTo(headImageView.snp.bottom).offset(Constants.profileCardStackViewTopOffset)
            $0.leading.trailing.equalToSuperview().inset(Constants.profileCardStackViewInsets)
            $0.bottom.equalToSuperview()
        }
        
        return view
    }()
    
    
    
    private lazy var nameLabel: UILabel = {
       let label = UILabel()
        
        return label
    }()
    
    private lazy var profileCardStackView: UIView = {
        let nameStackView = UIStackView(arrangedSubviews: [nameLabel, UIView(), tagView])
        
        let view = UIStackView(arrangedSubviews: [nameStackView, languageLabel, chargeLabel])
        view.axis = .vertical
        view.backgroundColor = Constants.profileCardStackViewBackgroundColor
        view.layer.cornerRadius = Constants.profileCardStackViewRadius
        view.layoutMargins = Constants.profileCardStackViewMargins
        view.isLayoutMarginsRelativeArrangement = true
        view.spacing = Constants.profileCardStackViewSpacing
        
        return view
    }()
    
    private lazy var tagView: UIView = {
        let view = UIView()
        view.backgroundColor = Constants.tagViewColor
        view.layer.cornerRadius = Constants.tagViewRadius
        
        // TODO: - Update tagView
        let label = UILabel()
        label.text = "TAGS"
        view.addSubview(label)
        label.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(5)
        }
        
        return view
    }()
    
    private lazy var languageLabel: UILabel = {
       let label = UILabel()
        
        return label
    }()
    
    private lazy var chargeLabel: UILabel = {
       let label = UILabel()
        
        return label
    }()
    
    private lazy var menuView: UISegmentedControl = {
        let view = UISegmentedControl(items: ["總覽", "開設課程"])
        view.backgroundColor = Constants.menuViewBackgroundColor
        view.selectedSegmentTintColor = Constants.menuViewTintColor
        view.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.black], for: .normal)
        view.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.white], for: .selected)
        
        // Default to select first item.
        view.selectedSegmentIndex = 0
        
        return view
    }()
    
    private lazy var buttonBarView: UIView = {
        let view = UIView()
        view.backgroundColor = Constants.buttonBarViewBackgroundColor
        view.addSubview(menuView)
        
        menuView.snp.makeConstraints {
            $0.top.leading.bottom.equalToSuperview().inset(Constants.menuViewInsets)
            $0.trailing.lessThanOrEqualToSuperview().inset(Constants.menuViewInsets)
        }
        
        return view
    }()
    
    private let introContainerView = UIView()
    
    private lazy var introVC: CommunicatorIntroVC = {
        let vc = CommunicatorIntroVC(vm: CommunicatorIntroVM())
        return vc
    }()
    
    // MARK: - Initializers
    
    init(vm: CommunicatorDetailVM) {
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
        view.backgroundColor = Constants.backgroundColor
        
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { $0.edges.equalToSuperview() }
        
        addChild(introVC)
        introVC.didMove(toParent: self)
        
        introContainerView.addSubview(introVC.view)
        introVC.view.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(Constants.introViewInsets)
        }
       
        stackView.addArrangedSubview(headView)
        stackView.addArrangedSubview(buttonBarView)
        stackView.addArrangedSubview(introContainerView)
        
        stackView.axis = .vertical
        
        scrollView.addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.edges.width.equalToSuperview()
        }
    }
    
    // MARK: - Bindings
    
    private func bindViewModel() {
        headImageView.kf.setImage(with: vm.communicator.imagUrl)
        
        nameLabel.text = "名稱"
        languageLabel.text = "語言"
        chargeLabel.text = "費用"
        
        let childScrollView = introVC.tableView
        
        // Let scrollView pan scroll priority higher than child.
        childScrollView.panGestureRecognizer.require(toFail: scrollView.panGestureRecognizer)
        
        childScrollView.rx.observe(CGSize.self, #keyPath(UIScrollView.contentSize))
            .subscribe(with: self, onNext: { `self`, _ in
                self.updateScrollViewContentSize()
            })
            .disposed(by: bag)
    }
    
    private func updateScrollViewContentSize() {
        let childScrollViewHeight = introVC.tableView.contentSize.height
        // Cause we calculate `newContentSize` without vertical insets, so need to pay attention, if we want to add
        // vertical insets inside scrollView.
        let contentHeight = headView.frame.height
            + buttonBarView.frame.height
            + childScrollViewHeight
        
        self.scrollView.contentSize = CGSize(width: view.frame.width, height: contentHeight)
        
        self.introContainerView.snp.remakeConstraints {
            $0.height.equalTo(childScrollViewHeight)
        }
    }
}

extension CommunicatorDetailVC: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let naviBarHeight = navigationController?.navigationBar.frame.maxY ?? 0.0
        let headHeight = headView.frame.height
        let buttonVarViewStickyY = headHeight - naviBarHeight
        
        if offsetY > 0 && offsetY >= buttonVarViewStickyY {
            buttonBarView.frame.origin.y = offsetY + naviBarHeight
            // Need to bring `buttonBarView` to front, otherwise, `buttonBarView` will be overlapped.
            stackView.bringSubviewToFront(buttonBarView)
        }
    }
}
