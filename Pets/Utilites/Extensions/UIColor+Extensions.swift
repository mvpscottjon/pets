//
//  UIColor+Extensions.swift
//  Pets
//
//  Created by Seven on 2022/7/17.
//

import UIKit

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int, a: CGFloat = 1.0) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")

        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }

    convenience init(hex: Int, a: CGFloat = 1.0) {
        self.init(red:(hex >> 16) & 0xff, green:(hex >> 8) & 0xff, blue:hex & 0xff, a: a)
    }

    convenience init(hexString: String, a: CGFloat = 1.0) {
        let hexString = hexString.replacingOccurrences(of: "#", with: "")
        let hexInt: Int = Int(hexString, radix: 16) ?? (0xFFFFFF)
        self.init(hex: hexInt, a: a)
    }
}

// MARK: - Colors

extension UIColor {
    static let mainColor = UIColor.init(hexString: "##aac3b6")
    static let background = UIColor.init(hexString: "#0xF7F8F8")
}

