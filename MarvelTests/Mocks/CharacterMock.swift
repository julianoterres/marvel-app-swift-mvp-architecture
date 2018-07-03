//
//  CharacterMock.swift
//  MarvelTests
//
//  Created by Juliano Terres on 02/07/18.
//  Copyright © 2018 Juliano Terres. All rights reserved.
//

import XCTest
@testable import Marvel

class CharacterMock {
    
    func characterWithAllData() -> Marvel.Character {
        let character = Marvel.Character()
        character.id = 1
        character.name = "Character Name"
        character.desc = "Character description"
        character.thumbnail = getThumbnail()
        character.comics = getComics()
        
        return character
    }
    
    func characterWithoutData() -> Marvel.Character {
        let character = Marvel.Character()
        character.id = 1
        character.name = ""
        character.desc = ""
        character.thumbnail = nil
        character.comics = nil
        
        return character
    }
    
    func charactersWithData() -> [Marvel.Character] {
        return [characterWithAllData()]
    }
    
    func charactersWithoutData() -> [Marvel.Character] {
        return [characterWithoutData()]
    }
    
    func getThumbnail() -> Thumbnail {
        let thumbnail = Thumbnail()
        thumbnail.path = "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784"
        thumbnail.typeFile = "jpg"
        return thumbnail
    }
    
    func getComics() -> Comics {
        let item1 = Items()
        item1.name = "Comics 1"
        
        let item2 = Items()
        item2.name = "Comics 2"
        
        let comics = Comics()
        comics.items = [item1, item2]
        
        return comics
    }
    
}
