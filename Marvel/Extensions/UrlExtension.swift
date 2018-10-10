//
//  UrlExtension.swift
//  Marvel
//
//  Created by Juliano Terres on 08/10/18.
//  Copyright © 2018 Juliano Terres. All rights reserved.
//

import Foundation

extension URL {
    
    static func characters(offset: String, limit: String) -> URL {
        let parameters = "&offset=" + offset + "&limit=" + limit
        return URL.init(string: self.url(method: "characters", parameters: parameters))!
    }
    
    static func comics(characterId: String) -> URL {
        return URL.init(string: self.url(method: "characters/" + characterId + "/comics"))!
    }
    
    static func testError() -> URL {
        return URL.init(string: self.url(method: "testeError"))!
    }
    
    static private func url(method: String, parameters: String = "") -> String {
        let apiBaseURl: String = PlistUtil.valueInfoToString(attribute: "API URL Base") ?? ""
        let apiKey: String = PlistUtil.valueInfoToString(attribute: "API Key") ?? ""
        let apiHash: String = PlistUtil.valueInfoToString(attribute: "API Hash") ?? ""
        let apiTs: String = PlistUtil.valueInfoToString(attribute: "API Ts") ?? ""
        return apiBaseURl + method + "?apikey=" + apiKey + "&hash=" + apiHash + "&ts=" + apiTs + parameters
    }
    
}
