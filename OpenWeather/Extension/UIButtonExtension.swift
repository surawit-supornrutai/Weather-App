//
//  UIButtonExtension.swift
//  OpenWeather
//
//  Created by jung on 11/4/2566 BE.
//

import Foundation
import UIKit

extension UIButton {
    
    func disableButtonRegister(btn: UIButton){
        btn.isEnabled = false
        btn.backgroundColor = UIColor(hex: "EFF3F8")
    }
    
    func enableButtonRegister(btn: UIButton){
        btn.isEnabled = true
        btn.backgroundColor = UIColor(hex: "78CE12")
    }
}
