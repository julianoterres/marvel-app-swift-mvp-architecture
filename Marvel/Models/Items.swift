//
//  Items.swift
//  Marvel
//
//  Created by Juliano Terres on 27/06/18.
//  Copyright © 2018 Juliano Terres. All rights reserved.
//

struct Items: Decodable, Equatable {
    var name: String?
    
    static func == (lhs: Items, rhs: Items) -> Bool {
        return lhs.name == rhs.name
    }
}
