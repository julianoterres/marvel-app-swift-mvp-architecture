//
//  CharacterResponse.swift
//  Marvel
//
//  Created by Juliano Terres on 07/07/18.
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
