//
//  CharacterMock.swift
//  MarvelTests
//
//  Created by Juliano Terres on 08/08/18.
//  Copyright © 2018 Juliano Terres. All rights reserved.
//

import Foundation
import XCTest
@testable import Marvel

class CharacterMock {
    
    static func characterWithAllData() -> Marvel.Character {
        var character = Marvel.Character()
        character.id = 1
        character.name = "Character Name"
        character.description = "Character description"
        character.thumbnail = getThumbnail()
        character.listComics = getComics()
        
        return character
    }
    
    static func characterWithoutData() -> Marvel.Character {
        var character = Marvel.Character()
        character.id = 1
        character.name = ""
        character.description = ""
        character.thumbnail = nil
        character.listComics = nil
        
        return character
    }
    
    static func charactersWithAllData() -> [Marvel.Character] {
        var characters = [Marvel.Character]()
        for _ in 0 ..< 20 {
            characters.append(characterWithAllData())
        }
        return characters
    }
    
    static func charactersWithoutData() -> [Marvel.Character] {
        var characters = [Marvel.Character]()
        for _ in 0 ..< 20 {
            characters.append(characterWithoutData())
        }
        return characters
    }
    
    static func getThumbnail() -> Thumbnail {
        var thumbnail = Thumbnail()
        thumbnail.path = "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784"
        thumbnail.extension = "jpg"
        return thumbnail
    }
    
    static func getComics() -> [Comic] {
        var comicOne = Comic()
        comicOne.title = "Comic 1"
        comicOne.thumbnail = getThumbnail()
        
        var comicTwo = Comic()
        comicTwo.title = "Comic 1"
        comicTwo.thumbnail = getThumbnail()
        
        return [comicOne, comicTwo]
    }
    
}
