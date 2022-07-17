//
//  AppCoordinator.swift
//  Pets
//
//  Created by Seven on 2022/7/14.
//

import Foundation
import UIKit

final class AppCoordinator: Coordinator {
    
    var childCoordinator: [Coordinator] = []
    var navigation: UINavigationController?
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let vc = ViewController()
        vc.view.backgroundColor = .green
        
        window.rootViewController = vc
    }
    
    func runMainFlow() {
        
    }

}
