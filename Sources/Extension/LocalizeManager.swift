//
//  LocalizeManager.swift
//  Coolism
//
//  Created by Thanya on 1/6/21.
//

import Foundation

enum LocalizeFile: String, CaseIterable {
    case general
    case user
    case error
}
extension String {

    public func localize() -> String {
        let currentLang = "th"
        guard let pathResource = Bundle.main.path(forResource: currentLang, ofType: "lproj") else { return self }
        
        guard let bundle = Bundle(path: pathResource) else { return self }
        
        var result: String = self
       LocalizeFile.allCases.forEach { file in
            let localizedString = NSLocalizedString(self, tableName: file.rawValue, bundle: bundle, value: "", comment: "")
            if localizedString != self {
                result = localizedString
                
            }
        }
        
        return result
    }
    
}
