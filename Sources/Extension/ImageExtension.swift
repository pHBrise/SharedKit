//
//  File.swift
//  
//
//  Created by Phanvit Chevamongkolnimit on 11/5/2566 BE.
//

import Foundation



extension UIImage {
    init(packageResource name: String, ofType type: String) {
#if canImport(UIKit)
        guard let path = Bundle.module.path(forResource: name, ofType: type),
              let image = UIImage(contentsOfFile: path) else {
            self.init(name)
            return
        }
        self.init(uiImage: image)
#else
        self.init(name)
#endif
    }
}



