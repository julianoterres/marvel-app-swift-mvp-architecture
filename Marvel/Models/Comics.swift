//
//  Comics.swift
//  Marvel
//
//  Created by Juliano Terres on 27/06/18.
//  Copyright © 2018 Juliano Terres. All rights reserved.
//

struct Comics: Decodable, Equatable {
    
    var items: [Items]?
    
    static func == (lhs: Comics, rhs: Comics) -> Bool {
        return lhs.items == rhs.items
    }
    
}
