//
//  Comics.swift
//  Marvel
//
//  Created by Juliano Terres on 27/06/18.
//  Copyright © 2018 Juliano Terres. All rights reserved.
//

import Foundation

struct ComicResponse: Decodable {
    var results: [Comic]?
}

struct ComicData: Decodable {
    var data: ComicResponse?
}

struct Comic: Decodable, Equatable {
    var title: String?
    var thumbnail: Thumbnail?
    
    func getImage(size: ImagesSizes) -> URL? {
        guard let thumbnail = self.thumbnail, let path = thumbnail.path, let type = thumbnail.extension,
            let url = URL(string: path+"/" + size.rawValue + "."+type) else {
                return nil
        }
        return url
    }
    
    static func == (lhs: Comic, rhs: Comic) -> Bool {
        return(
            lhs.title == rhs.title &&
            lhs.thumbnail == rhs.thumbnail
        )
    }
}
