//
//  PlistUtil.swift
//  Marvel
//
//  Created by Juliano Terres on 27/06/18.
//  Copyright © 2018 Juliano Terres. All rights reserved.
//

import Foundation

class PlistUtil: NSObject {
    
    static func valueInfoToString(attribute: String) -> String? {
        guard let path = Bundle.main.path(forResource: "Info", ofType: "plist"), let myDict = NSDictionary(contentsOfFile: path), let value = myDict[attribute] else { return "" }
        return value as? String ?? nil
    }
    
}
