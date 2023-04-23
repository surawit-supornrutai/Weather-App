//
//  UIViewExtension.swift
//  OpenWeather
//
//  Created by jung on 11/4/2566 BE.
//

import Foundation
import UIKit

extension UIView {
    func addSubviews(_ views: [UIView]) {
        views.forEach{
            self.addSubview($0)
        }
    }
    func addConstraints(with format: String,to views: UIView..., topPadding: CGFloat = 0, leftPadding: CGFloat = 0, bottomPadding: CGFloat = 0, rightPadding: CGFloat = 0) {
        
        var viewsDictionary = [String: UIView]()
        
        var metrics = [String: Any]()
        
        if #available(iOS 11.0, *) {
            metrics = [
                "top": safeAreaInsets.top + topPadding,
                "bottom": safeAreaInsets.bottom + bottomPadding,
                "left": safeAreaInsets.left + leftPadding,
                "right": safeAreaInsets.right + rightPadding,
            ]
            
        } else {
            metrics = [
                "top": topPadding,
                "bottom": bottomPadding,
                "left": leftPadding,
                "right": rightPadding,
            ]
        }
        
        let _ = views.enumerated().compactMap{
            (index, view) in
            let key = "v\(index)"
            viewsDictionary[key] = view
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutConstraint.FormatOptions(), metrics: metrics, views: viewsDictionary))
    }
    
    
}
