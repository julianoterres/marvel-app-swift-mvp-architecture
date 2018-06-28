//
//  Items.swift
//  Marvel
//
//  Created by Juliano Terres on 27/06/18.
//  Copyright © 2018 Juliano Terres. All rights reserved.
//

import ObjectMapper

class Items: NSObject, Mappable {
    
    var name: String?
    
    override init() {}
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        name <- map["name"]
    }
    
}
