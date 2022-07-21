//
//  MainTabBarVC.swift
//  Pets
//
//  Created by Seven on 2022/7/15.
//

import UIKit

class MainTabBarVC: UITabBarController {

    private enum Constants {
        static let backgroundColor = UIColor.background
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }

    private func setupViews() {
        view.backgroundColor = Constants.backgroundColor
        
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        
        tabBar.standardAppearance = appearance
        tabBar.scrollEdgeAppearance = tabBar.standardAppearance
    }
    
}
