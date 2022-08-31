//
//  MainTabBarCoordinator.swift
//  Pets
//
//  Created by Seven on 2022/7/15.
//

import Foundation
import RxSwift

final class MainCoordinator: Coordinator<Void> {
    
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    override func start() -> Observable<Void> {
        let tabBarVC = MainTabBarVC()
        tabBarVC.viewControllers = [
            makeTabBarItemVC(tabBarItemType: .home),
            makeTabBarItemVC(tabBarItemType: .communicator),
            makeTabBarItemVC(tabBarItemType: .profile)
        ]

        window.rootViewController = tabBarVC
        
        return .empty()
    }
    
    private func makeTabBarItemVC(tabBarItemType type: UITabBarItem.ItemType) -> UIViewController {
        let vc: UIViewController
        
        switch type {
        case .home:
            vc = NewsFeedVC(vm: NewsFeedVM())
        case .communicator:
            vc = PetCommunicatorVC(vm: PetCommunicatorVM())
        case .profile:
            vc = UIViewController()
        }
        
        // Use `TabBarItemType`'s title as navigation title
        vc.navigationItem.title = type.title
        
        let nc = GeneralNavigationController(rootViewController: vc)
        nc.tabBarItem.title = type.title
        nc.tabBarItem.image = type.image
        return nc
    }
}
