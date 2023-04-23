//
//  UIColorExtension.swift
//  OpenWeather
//
//  Created by jung on 11/4/2566 BE.
//

import Foundation
import UIKit

extension UIColor {
    
    convenience init(hex: String, a: CGFloat = 1.0) {
        let scanner = Scanner(string: hex)
        scanner.scanLocation = 0
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)
        
        let r = (rgbValue & 0xff0000) >> 16
        let g = (rgbValue & 0xff00) >> 8
        let b = rgbValue & 0xff
        
        self.init(
            red: CGFloat(r) / 0xff,
            green: CGFloat(g) / 0xff,
            blue: CGFloat(b) / 0xff, alpha: a
        )
    }
    
    
    struct AppColor {
        static let AppTheme = UIColor(hex: "66AB1C")
        static let Yellow = UIColor(hex: "ffbf00")
        static let YellowDark = UIColor(hex: "cc9900")
        static let Black = UIColor(hex: "000000")
        static let Gray = UIColor(hex: "8F8E94")
        static let GrayLight = UIColor(hex: "c5c4c6")
        static let GraySuperLight = UIColor(hex: "eaeaea")
        static let GraySuperLight2 = UIColor(hex: "f9faf8")
        static let GrayDark = UIColor(hex: "706f6f")
        static let White = UIColor(hex: "ffffff")
        static let Red = UIColor(hex: "d62222")
        static let RedLight = UIColor(hex: "ff6666")
        static let Green = UIColor(hex: "66AB1C")
        static let GreenLight = UIColor(hex: "ECF3E4")
        static let GreenDark = UIColor(hex: "1a8623")
        static let Blue = UIColor(hex: "007AFF")
        static let BlueDark = UIColor(hex: "026384")
        static let BlueLight = UIColor(hex: "deebf6")
        static let BlueOcean = UIColor(hex: "44a8b9")
        static let BrownDark = UIColor(hex: "2a1f14")
        static let StarRating = UIColor(hex: "e1e549")
        static let BGLoad = UIColor(hex: "ffffff", a: 0.7)
        static let BGHeader = UIColor(hex: "424242", a: 0.7)
        static let CircleBorder = UIColor(hex: "ecf3e4")
        static let Purple = UIColor(hex: "ab2b94")
        static let PurpleBlue = UIColor(hex: "7d8ae9")
        static let PurplePink = UIColor(hex: "a9597d")
        static let OrangeDark = UIColor(hex: "f27f4f")
        static let Gold = UIColor(hex: "8E6609")
    }
}
