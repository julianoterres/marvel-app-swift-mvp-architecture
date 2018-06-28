//
//  UrlDefinition.swift
//  Marvel
//
//  Created by Juliano Terres on 27/06/18.
//  Copyright © 2018 Juliano Terres. All rights reserved.
//

import Foundation

class UrlDefinition {
    
    private static let apiBaseURl: String = PlistUtil.valueInfoToString(attribute: "API URL Base") ?? ""
    private static let apiKey: String = PlistUtil.valueInfoToString(attribute: "API Key") ?? ""
    private static let apiHash: String = PlistUtil.valueInfoToString(attribute: "API Hash") ?? ""
    private static let apiTs: String = PlistUtil.valueInfoToString(attribute: "API Ts") ?? ""
    
    static func characters(offset: String, limit: String) -> URL {
        let parameters = "&offset=" + offset + "&limit=" + limit
        return URL.init(string: self.url(method: "characters", parameters: parameters))!
    }
    
    private static func url(method: String, parameters: String = "") -> String {
        return apiBaseURl + method + "?apikey=" + apiKey + "&hash=" + apiHash + "&ts=" + apiTs + parameters
    }
    
}
