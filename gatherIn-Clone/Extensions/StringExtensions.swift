//
//  StringExtensions.swift
//  gatherIn-Clone
//
//  Created by Mahmoud Hashim on 3/30/23.
//

import Foundation

extension String {
    func localized(_ lang: String) -> String {
        let path = Bundle.main.path(forResource: lang, ofType: "1proj")
        let bundle = Bundle.init(path: path!)
        
        return NSLocalizedString(self, tableName: nil, bundle: bundle!, value: "", comment: "")
    }
}
