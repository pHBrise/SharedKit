//
//  UIViewExtension.swift
//  RSMallShopping
//
//  Created by Mix on 9/12/2563 BE.
//  Copyright © 2563 BE RS. All rights reserved.
//

import UIKit

extension UIView {
    
    func loadViewFromNib() {
        guard let nibName = NSStringFromClass(type(of: self)).components(separatedBy: ".").last else {return}
        
        guard let view =  Bundle(for: type(of: self)).loadNibNamed(nibName, owner: self, options: nil)?.first as? UIView else {return}
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        let views = ["view": view]
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[view]-0-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: views))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[view]-0-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: views))
        setNeedsUpdateConstraints()
    }
    func addShadow(color: UIColor = .darkGray, opacity: Float = 0.4, radius: CGFloat = 5.0) {
        layer.shadowOffset = CGSize(width: 0.5, height: 0.5)
        layer.shadowRadius = radius
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = opacity
        layer.masksToBounds = false
        layer.cornerRadius = 5
    }
    
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
    
    func image() -> UIImage {
        UIGraphicsBeginImageContextWithOptions(bounds.size, isOpaque, 0)
        guard let context = UIGraphicsGetCurrentContext() else {
            return UIImage()
        }
        layer.render(in: context)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
}
