//
//  CharacterServiceMock.swift
//  MarvelTests
//
//  Created by Juliano Terres on 11/09/18.
//  Copyright © 2018 Juliano Terres. All rights reserved.
//

import Foundation
import UIKit
@testable import Marvel

class CharacterServiceMock: CharacterServiceProtocol {
    
    func getAllWithPagination(offset: String, limit: String, success: @escaping(_ characters: [Marvel.Character], _ totalCharacters: Int) -> Void, failure: @escaping(_ message: String) -> Void) {
        let characters = CharacterMock.charactersWithAllData()
        success(characters, characters.count)
    }
    
    func getComics(characterId: String, success: @escaping ([Comic]) -> Void, failure: @escaping (String) -> Void) {
        let comics = CharacterMock.getComics()
        success(comics)
    }
    
}
