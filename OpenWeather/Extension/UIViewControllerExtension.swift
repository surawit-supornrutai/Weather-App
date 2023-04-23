//
//  UIViewControllerExtension.swift
//  OpenWeather
//
//  Created by jung on 11/4/2566 BE.
//

import Foundation
import UIKit

extension UIViewController {
    func hideKeyboardWhenTappedAroundTableView() {
        let tapGesture = UITapGestureRecognizer(target: self, action:#selector(handleTap(_:)))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            // Do your thang here!
            self.view.endEditing(true)
            for textField in self.view.subviews where textField is UITextField {
                textField.resignFirstResponder()
            }
        }
        sender.cancelsTouchesInView = false
    }
}
