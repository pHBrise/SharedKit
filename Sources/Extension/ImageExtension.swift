//
//  File.swift
//  
//
//  Created by Phanvit Chevamongkolnimit on 11/5/2566 BE.
//

import Foundation
import UIKit


extension UIImage {
    public class func packageResource(named: String) -> UIImage? {
        return UIImage(named: named, in: Bundle.module, compatibleWith: nil)
    }
}



