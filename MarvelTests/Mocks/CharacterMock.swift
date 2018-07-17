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
        var character = Marvel.Character()
        character.id = 1
        character.name = "Character Name"
        character.description = "Character description"
        character.thumbnail = getThumbnail()
        character.comics = getComics()
        
        return character
    }
    
    func characterWithoutData() -> Marvel.Character {
        var character = Marvel.Character()
        character.id = 1
        character.name = ""
        character.description = ""
        character.thumbnail = nil
        character.comics = nil
        
        return character
    }
    
    func charactersWithData() -> [Marvel.Character] {
        var characters = [Marvel.Character]()
        for _ in 0 ..< 20 {
            characters.append(characterWithAllData())
        }
        return characters
    }
    
    func charactersWithoutData() -> [Marvel.Character] {
        var characters = [Marvel.Character]()
        for _ in 0 ..< 20 {
            characters.append(characterWithoutData())
        }
        return characters
    }
    
    func getThumbnail() -> Thumbnail {
        var thumbnail = Thumbnail()
        thumbnail.path = "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784"
        thumbnail.extension = "jpg"
        return thumbnail
    }
    
    func getComics() -> Comics {
        var item1 = Items()
        item1.name = "Comics 1"
        
        var item2 = Items()
        item2.name = "Comics 2"
        
        var comics = Comics()
        comics.items = [item1, item2]
        
        return comics
    }
    
}
