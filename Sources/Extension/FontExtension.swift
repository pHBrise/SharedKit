//
//  FontExtension.swift
//  ULife
//
//  Created by Phanvit Chevamongkolnimit on 28/4/2566 BE.
//

import Foundation
import UIKit

extension UIFont {

    public class func kanitBlack(ofSize size: CGFloat) -> UIFont {
        return kanit(ofSize: size, weight: .black, isItalic: false)
    }
    
    public class func kanitBlackItalic(ofSize size: CGFloat) -> UIFont {
        return kanit(ofSize: size, weight: .black, isItalic: true)
    }
    
    public class func kanitBold(ofSize size: CGFloat) -> UIFont {
        return kanit(ofSize: size, weight: .bold, isItalic: false)
    }
    
    public class func kanitBoldItalic(ofSize size: CGFloat) -> UIFont {
        return kanit(ofSize: size, weight: .bold, isItalic: true)
    }
    
    public class func kanitExtraBold(ofSize size: CGFloat) -> UIFont {
        return kanit(ofSize: size, weight: .heavy, isItalic: false)
    }
    
    public class func kanitExtraBoldItalic(ofSize size: CGFloat) -> UIFont {
        return kanit(ofSize: size, weight: .heavy, isItalic: true)
    }
    
    public class func kanitExtraLight(ofSize size: CGFloat) -> UIFont {
        return kanit(ofSize: size, weight: .ultraLight, isItalic: false)
    }
    
    public class func kanitExtraLightItalic(ofSize size: CGFloat) -> UIFont {
        return kanit(ofSize: size, weight: .ultraLight, isItalic: true)
    }
    
    public class func kanitItalic(ofSize size: CGFloat) -> UIFont {
        return kanit(ofSize: size, weight: .regular, isItalic: true)
    }
    
    public class func kanitLight(ofSize size: CGFloat) -> UIFont {
        return kanit(ofSize: size, weight: .light, isItalic: false)
    }
    
    public class func kanitLightItalic(ofSize size: CGFloat) -> UIFont {
        return kanit(ofSize: size, weight: .light, isItalic: true)
    }
    
    public class func kanitMedium(ofSize size: CGFloat) -> UIFont {
        return kanit(ofSize: size, weight: .medium, isItalic: false)
    }
    
    public class func kanitMediumItalic(ofSize size: CGFloat) -> UIFont {
        return kanit(ofSize: size, weight: .medium, isItalic: true)
    }
    
    public class func kanitRegular(ofSize size: CGFloat) -> UIFont {
        return kanit(ofSize: size, weight: .regular, isItalic: false)
    }
    
    public class func kanitSemiBold(ofSize size: CGFloat) -> UIFont {
        return kanit(ofSize: size, weight: .semibold, isItalic: false)
    }
    
    public class func kanitSemiBoldItalic(ofSize size: CGFloat) -> UIFont {
        return kanit(ofSize: size, weight: .semibold, isItalic: true)
    }
    
    public class func kanitThin(ofSize size: CGFloat) -> UIFont {
        return kanit(ofSize: size, weight: .thin, isItalic: false)
    }
    
    public class func kanitThinItalic(ofSize size: CGFloat) -> UIFont {
        return kanit(ofSize: size, weight: .thin, isItalic: true)
    }

    class func kanit(ofSize size: CGFloat, weight: UIFont.Weight = .light, isItalic: Bool = false) -> UIFont {
        let systemFont = UIFont.systemFont(ofSize: size, weight: weight)
        enum Kanit: String {
            case black = "Kanit-Black"
            case blackItalic = "Kanit-BlackItalic"
            case bold = "Kanit-Bold"
            case boldItalic = "Kanit-BoldItalic"
            case extraBold = "Kanit-ExtraBold"
            case extraBoldItalic = "Kanit-ExtraBoldItalic"
            case extraLight = "Kanit-ExtraLight"
            case extraLightItalic = "Kanit-ExtraLightItalic"
            case italic = "Kanit-Italic"
            case light = "Kanit-Light"
            case lightItalic = "Kanit-LightItalic"
            case medium = "Kanit-Medium"
            case mediumItalic = "Kanit-MediumItalic"
            case regular = "Kanit-Regular"
            case semiBold = "Kanit-SemiBold"
            case semiBoldItalic = "Kanit-SemiBoldItalic"
            case thin = "Kanit-Thin"
            case thinItalic = "Kanit-ThinItalic"
        }
        
        switch weight {
        case .black:
            let name = !isItalic ? Kanit.black : Kanit.blackItalic
            return UIFont(name: name.rawValue, size: size) ?? systemFont
        case .bold:
            let name = !isItalic ? Kanit.bold : Kanit.boldItalic
            return UIFont(name: name.rawValue, size: size) ?? systemFont
        case .heavy:
            let name = !isItalic ? Kanit.extraBold : Kanit.extraBoldItalic
            return UIFont(name: name.rawValue, size: size) ?? systemFont
        case .light:
            let name = !isItalic ? Kanit.light : Kanit.lightItalic
            return UIFont(name: name.rawValue, size: size) ?? systemFont
        case .medium:
            let name = !isItalic ? Kanit.medium : Kanit.mediumItalic
            return UIFont(name: name.rawValue, size: size) ?? systemFont
        case .regular:
            let name = !isItalic ? Kanit.regular : Kanit.italic
            return UIFont(name: name.rawValue, size: size) ?? systemFont
        case .semibold:
            let name = !isItalic ? Kanit.semiBold : Kanit.semiBoldItalic
            return UIFont(name: name.rawValue, size: size) ?? systemFont
        case .thin:
            let name = !isItalic ? Kanit.thin : Kanit.thinItalic
            return UIFont(name: name.rawValue, size: size) ?? systemFont
        case .ultraLight:
            let name = !isItalic ? Kanit.extraLight : Kanit.extraLightItalic
            return UIFont(name: name.rawValue, size: size) ?? systemFont
        default:
            let name = !isItalic ? Kanit.regular : Kanit.italic
            return UIFont(name: name.rawValue, size: size) ?? systemFont
        }
    }

}
