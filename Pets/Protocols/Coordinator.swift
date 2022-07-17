//
//  Coordinator.swift
//  Pets
//
//  Created by Seven on 2022/7/14.
//

import UIKit

protocol Coordinator {
    var childCoordinator: [Coordinator] { get set }
    var navigation: UINavigationController? { get set }
    
    func removeChildCoordinator(child: Coordinator?)
    func start()
}

extension Coordinator {
    func removeChildCoordinator(child: Coordinator?) {
        
    }
}

