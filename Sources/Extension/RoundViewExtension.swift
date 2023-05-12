//
//  RoundViewExtension.swift
//  RSMallShopping
//
//  Created by Mix on 9/12/2563 BE.
//  Copyright © 2563 BE RS. All rights reserved.
//

import UIKit

@IBDesignable open class RoundedImage: UIImageView {
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        applyCornerRadius()
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        applyCornerRadius()
    }
    
    @IBInspectable open var circular: Bool = false {
        didSet {
            rounded = true
            applyCornerRadius()
        }
    }
    
    @IBInspectable open var rounded: Bool = false {
        didSet {
            applyCornerRadius()
        }
    }
    
    @IBInspectable open var cornerRadius: CGFloat = 0.1 {
        didSet {
            applyCornerRadius()
        }
    }
    
    @IBInspectable open var borderColor : UIColor = UIColor.clear {
        didSet {
            applyCornerRadius()
        }
    }
    
    @IBInspectable open var borderWidth : Double = 0 {
        didSet {
            applyCornerRadius()
        }
    }
    
    func applyCornerRadius() {
        if(self.circular) {
            layer.cornerRadius = bounds.size.height/2
            layer.masksToBounds = true
            layer.borderColor = borderColor.cgColor
            layer.borderWidth = CGFloat(borderWidth)
        } else {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = true
            layer.borderColor = self.borderColor.cgColor
            layer.borderWidth = CGFloat(borderWidth)
        }
    }
    
    open override class func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
    }
}

@IBDesignable open class RoundedView: UIView {
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        if shadow {
            applyShadow()
            return
        }
        applyCornerRadius()
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        if shadow {
            applyShadow()
            return
        }
        applyCornerRadius()
        
    }
    
    @IBInspectable open var circular: Bool = false {
        didSet {
            rounded = true
            applyCornerRadius()
        }
    }
    
    @IBInspectable open var rounded: Bool = false {
        didSet {
            applyCornerRadius()
        }
    }
    
    @IBInspectable open var cornerRadius: CGFloat = 0.1 {
        didSet {
            applyCornerRadius()
        }
    }
    
    @IBInspectable open var borderColor : UIColor = UIColor.clear {
        didSet {
            applyCornerRadius()
        }
    }
    
    @IBInspectable open var borderWidth : Double = 0 {
        didSet {
            applyCornerRadius()
        }
    }
    
    @IBInspectable open var shadow : Bool = false {
        didSet {
            if shadow {
                applyShadow()
            }
        }
    }
    
    func applyShadow() {
        addShadow()
    }
    
    func applyCornerRadius() {
        if(self.circular) {
            layer.cornerRadius = bounds.size.height/2
            layer.masksToBounds = true
            layer.borderColor = borderColor.cgColor
            layer.borderWidth = CGFloat(borderWidth)
        } else {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = true
            layer.borderColor = self.borderColor.cgColor
            layer.borderWidth = CGFloat(borderWidth)
        }
    }
    open override class func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
    }
}

@IBDesignable open class RoundedButton: UIButton {
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        applyCornerRadius()
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        applyCornerRadius()
    }
    
    @IBInspectable open var circular: Bool = false {
        didSet {
            rounded = true
            applyCornerRadius()
        }
    }
    
    @IBInspectable open var rounded: Bool = false {
        didSet {
            applyCornerRadius()
        }
    }
    
    @IBInspectable open var cornerRadius: CGFloat = 0.1 {
        didSet {
            applyCornerRadius()
        }
    }
    
    @IBInspectable open var borderColor : UIColor = UIColor.clear {
        didSet {
            applyCornerRadius()
        }
    }
    
    @IBInspectable open var borderWidth : Double = 0 {
        didSet {
            applyCornerRadius()
        }
    }
    
    @IBInspectable open var tintImage: UIColor = .white {
        didSet {
            setImage(imageView?.image?.withTintColor(tintImage), for: .normal)
        }
    }
    func applyCornerRadius() {
        if(self.circular) {
            layer.cornerRadius = bounds.size.height/2
            layer.masksToBounds = true
            layer.borderColor = borderColor.cgColor
            layer.borderWidth = CGFloat(borderWidth)
        } else {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = true
            layer.borderColor = self.borderColor.cgColor
            layer.borderWidth = CGFloat(borderWidth)
        }
    }
    open override var isEnabled: Bool {
        didSet {
            backgroundColor = isEnabled ? .defaultBackgroundColor:.lightGray
        }
    }
    open override class func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
    }
}

@IBDesignable open class RoundedLabel: UILabel {
    @IBInspectable
    open var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set (radius) {
            layer.cornerRadius = radius
            layer.masksToBounds = radius > 0
        }
    }
    
    @IBInspectable
    open var borderWidth: CGFloat {
        get {
            return self.layer.borderWidth
        }
        
        set (borderWidth) {
            layer.masksToBounds = true
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable
    open var borderColor: UIColor? {
        get {
            if let color = self.layer.borderColor {
                return UIColor(cgColor: color)
            } else {
                return nil
            }
        }
        set (color) {
            layer.borderColor = color?.cgColor
        }
    }
    
    open override class func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
    }
}
