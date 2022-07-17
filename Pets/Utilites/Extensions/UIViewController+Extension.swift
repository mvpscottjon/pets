//
//  UIViewController+Extension.swift
//  Pets
//
//  Created by Seven on 2022/7/16.
//

import UIKit

extension UIViewController {
    var topMostViewController: UIViewController? {
        return getTopViewController()
    }
    
    private func getTopViewController() -> UIViewController? {
        let scenes = UIApplication.shared.connectedScenes
        let windowScene = scenes.first as? UIWindowScene
        guard let window = windowScene?.windows.first else { return nil }
        var topMostViewController = window.rootViewController
        
        while let presentedViewController = topMostViewController?.presentedViewController {
            topMostViewController = presentedViewController
        }

        return topMostViewController
    }
}
