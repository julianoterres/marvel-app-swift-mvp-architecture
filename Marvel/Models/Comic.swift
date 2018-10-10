//
//  Comics.swift
//  Marvel
//
//  Created by Juliano Terres on 27/06/18.
//  Copyright © 2018 Juliano Terres. All rights reserved.
//

struct ComicResponse: Decodable {
    var results: [Comic]?
}

struct ComicData: Decodable {
    var data: ComicResponse?
}

struct Comic: Decodable, Equatable {
    
    var title: String?
    var thumbnail: Thumbnail?
    
    static func == (lhs: Comic, rhs: Comic) -> Bool {
        return(
            lhs.title == rhs.title &&
            lhs.thumbnail == rhs.thumbnail
        )
    }
    
}
