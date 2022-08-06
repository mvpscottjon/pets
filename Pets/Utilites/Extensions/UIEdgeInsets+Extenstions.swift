//
//  UIEdgeInsets+Extenstions.swift
//  Pets
//
//  Created by Seven on 2022/8/5.
//

import UIKit

extension UIEdgeInsets {
    init(insets: CGFloat) {
        self.init(top: insets, left: insets, bottom: insets, right: insets)
    }
    
    init(horizontalInsets: CGFloat, verticalInsets: CGFloat) {
        self.init(top: verticalInsets, left: horizontalInsets, bottom: verticalInsets, right: horizontalInsets)
    }
}
