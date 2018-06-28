//
//  Events.swift
//  Marvel
//
//  Created by Juliano Terres on 27/06/18.
//  Copyright © 2018 Juliano Terres. All rights reserved.
//

import ObjectMapper

class Events: NSObject, Mappable {
    
    var items: [Items]?
    
    override init() {}
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        items <- map["items"]
    }
    
}
