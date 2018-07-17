//
//  Character.swift
//  Marvel
//
//  Created by Juliano Terres on 27/06/18.
//  Copyright © 2018 Juliano Terres. All rights reserved.
//

import Foundation

struct Character: Decodable, Equatable {
    var id: Int?
    var name: String?
    var description: String?
    var thumbnail: Thumbnail?
    var comics: Comics?
    
    func getImage(size: EnumImagesSizes) -> URL? {
        guard let thumbnail = self.thumbnail, let path = thumbnail.path, let type = thumbnail.extension,
            let url = URL(string: path+"/" + size.rawValue + "."+type) else {
                return nil
        }
        return url
    }
    
    static func == (lhs: Character, rhs: Character) -> Bool {
        return true
    }
}
