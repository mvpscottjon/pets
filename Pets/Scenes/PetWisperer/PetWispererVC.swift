//
//  PetWispererVC.swift
//  Pets
//
//  Created by Seven on 2022/7/24.
//

import UIKit

class PetWispererVC: UIViewController {

    private let vm: PetWispererVM
    
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

    }

}
