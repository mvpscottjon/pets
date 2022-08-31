//
//  DoctorDetailVC.swift
//  Pets
//
//  Created by Seven on 2022/8/7.
//

import UIKit

class DoctorDetailVC: UIViewController {
    private enum Constants {
        static let backgroundColor = UIColor.background
    }
    
    private let vm : DoctorDetailVM
    
    init(vm: DoctorDetailVM) {
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
    }
    
    private func setupViews() {
        view.backgroundColor = Constants.backgroundColor
    }
}
