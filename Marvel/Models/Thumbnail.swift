//
//  Thumbnail.swift
//  Marvel
//
//  Created by Juliano Terres on 27/06/18.
//  Copyright © 2018 Juliano Terres. All rights reserved.
//

struct Thumbnail: Decodable, Equatable {
    var path: String?
    var `extension`: String?
    
    static func == (lhs: Thumbnail, rhs: Thumbnail) -> Bool {
        return (
            lhs.path == rhs.path &&
            lhs.extension == rhs.extension
        )
    }
}
