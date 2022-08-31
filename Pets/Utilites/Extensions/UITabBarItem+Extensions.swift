//
//  UITabBarItem+Extensions.swift
//  Pets
//
//  Created by Seven on 2022/7/17.
//

import UIKit

extension UITabBarItem {
    
    private enum Constants {
        static let homeItemImage = UIImage(systemName: "house.fill")
        static let homeItemTitle = "Home"
        static let communicatorItemImage = UIImage(systemName: "pawprint.fill")
        static let communicatorTitle = "Communicator"
        static let profileItemImage = UIImage(systemName: "person.crop.circle.fill")
        static let profileItemTitle = "Profile"
    }
    
    enum ItemType {
        case home, communicator, profile
        
        var title: String? {
            switch self {
            case .home:
                return Constants.homeItemTitle
            case .profile:
                return Constants.profileItemTitle
            case .communicator:
                return Constants.communicatorTitle
            }
        }
        
        var image: UIImage? {
            switch self {
            case .home:
                return Constants.homeItemImage
            case .profile:
                return Constants.profileItemImage
            case .communicator:
                return Constants.communicatorItemImage
            }
        }
    }
}
