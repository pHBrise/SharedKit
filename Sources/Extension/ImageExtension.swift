//
//  File.swift
//  
//
//  Created by Phanvit Chevamongkolnimit on 11/5/2566 BE.
//

import Foundation



extension UIImage {
    init(packageResource name: String) {
#if canImport(UIKit)
        let image = UIImage(named: name, in: Bundle.module, compatibleWith: nil)
        self.init(uiImage: image)
#else
        self.init(name)
#endif
    }
}



