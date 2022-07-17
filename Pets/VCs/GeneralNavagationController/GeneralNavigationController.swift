//
//  GeneralNavigationController.swift
//  Pets
//
//  Created by Seven on 2022/7/17.
//

import UIKit

class GeneralNavigationController: UINavigationController {

    private enum Constants {
        static let backgroundColor = UIColor.mainColor
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    private func setupViews() {
        // iOS 15 need to use this. Otherwise, the background color won't be covered status bar.
        // Could see: https://developer.apple.com/forums/thread/682420
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = Constants.backgroundColor
        
        navigationBar.titleTextAttributes = [.foregroundColor: UIColor.red]
        navigationBar.standardAppearance = appearance
        navigationBar.scrollEdgeAppearance = navigationBar.standardAppearance
    }
}
