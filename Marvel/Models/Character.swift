//
//  Character.swift
//  Marvel
//
//  Created by Juliano Terres on 27/06/18.
//  Copyright © 2018 Juliano Terres. All rights reserved.
//

import Foundation

struct CharacterResponse: Decodable {
    var offset: Int?
    var limit: Int?
    var total: Int?
    var count: Int?
    var results: [Character]?
}

struct CharacterData: Decodable {
    var data: CharacterResponse?
}

struct Character: Decodable, Equatable {
    var id: Int?
    var name: String?
    var description: String?
    var thumbnail: Thumbnail?
    var listComics: [Comic]?
    
    func getImage(size: ImagesSizes) -> URL? {
        guard let thumbnail = self.thumbnail, let path = thumbnail.path, let type = thumbnail.extension,
            let url = URL(string: path+"/" + size.rawValue + "."+type) else {
                return nil
        }
        return url
    }
    
    static func == (lhs: Character, rhs: Character) -> Bool {
        return (
            lhs.id == rhs.id &&
            lhs.name == rhs.name &&
            lhs.description == rhs.description &&
            lhs.thumbnail == rhs.thumbnail &&
            lhs.listComics == rhs.listComics
        )
    }
}
