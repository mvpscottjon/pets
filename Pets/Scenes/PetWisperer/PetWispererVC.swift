//
//  PetWispererVC.swift
//  Pets
//
//  Created by Seven on 2022/7/24.
//

import UIKit
import RxSwift
import SnapKit

class PetWispererVC: UIViewController {

    private enum Constants {
        static let stackViewInsets = UIEdgeInsets(horizontalInsets: 10.0, verticalInsets: 5.0)
        static let backgroundColor = UIColor.background
        static let stackViewSpacing = 20.0
    }
    
    // MARK: - Properties
    
    private let vm: PetWispererVM
    private let bag = DisposeBag()
    
    
    // MARK: - Views
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = Constants.stackViewSpacing

        return stackView
    }()
    
    
    // MARK: - Initializers
    
    init(vm: PetWispererVM) {
        self.vm = vm
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        bindViewModels()
    }

    // MARK: - Setups
    
    private func setupViews(){
        view.backgroundColor = Constants.backgroundColor
        
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        scrollView.addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.edges.width.equalToSuperview().inset(Constants.stackViewInsets)
        }
    }
    
    // MARK: - Bindings
    
    private func bindViewModels() {
        vm.state.sections
            .drive(with: self, onNext: { `self`, sections in
                self.updateSectionViews(sections)
            })
            .disposed(by: bag)
    }
    
    private func updateSectionViews(_ sections: [PetWispererVM.Section]) {
        stackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        
        sections.forEach {
            stackView.addArrangedSubview(makeSectionView(section: $0))
        }
    }
    
    // MARK: - Factories
    
    private func makeSectionView(section: PetWispererVM.Section) -> UIView {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        
        let sectionView: UIView
        switch section {
        case .doctor(let doctors):
            sectionView = makeDoctorView(doctors: doctors)
        case .wisperer(let wisperers):
            sectionView = makeWispererView(wisperers: wisperers)
        }
        
        stackView.addArrangedSubview(sectionView)
        
        sectionView.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.leading.equalToSuperview()
        }
        
        return stackView
    }
    
    private func makeDoctorView(doctors: [Doctor]) -> UIView {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10.0
        
        let titleLabel = UILabel()
        titleLabel.text = "醫生"
        titleLabel.setContentCompressionResistancePriority(.required, for: .horizontal)

        stackView.addArrangedSubview(titleLabel)
        
        doctors.forEach {
            let view = DoctorView(doctor: $0)
            stackView.addArrangedSubview(view)
        }
        
        return stackView
    }
    
    private func makeWispererView(wisperers: [Wisperer]) -> UIView {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10.0
        
        let titleLabel = UILabel()
        titleLabel.text = "溝通師"
        titleLabel.setContentCompressionResistancePriority(.required, for: .horizontal)
        
        stackView.addArrangedSubview(titleLabel)
        
        wisperers.forEach {
            let view = WispererView(wisperer: $0 )
            stackView.addArrangedSubview(view)
        }
        
        return stackView
    }
}
