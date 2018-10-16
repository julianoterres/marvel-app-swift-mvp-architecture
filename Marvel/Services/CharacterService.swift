//
//  CharacterService.swift
//  Marvel
//
//  Created by Juliano Terres on 27/06/18.
//  Copyright © 2018 Juliano Terres. All rights reserved.
//

import Foundation
import Alamofire

class CharacterService: CharacterServiceProtocol {
    
    func getAllWithPagination(offset: String, limit: String, success: @escaping(_ characters: [Character], _ totalCharacters: Int) -> Void, failure: @escaping(_ message: String) -> Void) {
        Network.request(url: URL.characters(offset: offset, limit: limit), method: .get, parameters: nil, completion: { (response) in
            do {
                let characterData: CharacterData = try JSONDecoder().decode(CharacterData.self, from: response)
                guard let characters = characterData.data?.results, characters.count >= 1, let totalCharacters = characterData.data?.total else {
                    failure("No result of characters in the search")
                    return
                }
                success(characters, totalCharacters)
            } catch {
                failure("Failed to get API characters")
            }
        }, failure: { error in
            failure(error)
        })
    }
    
    func getComics(characterId: String, success: @escaping(_ characters: [Comic]) -> Void, failure: @escaping(_ message: String) -> Void) {
        Network.request(url: URL.comics(characterId: characterId), method: .get, parameters: nil, completion: { (response) in
            do {
                let comicsData: ComicData = try JSONDecoder().decode(ComicData.self, from: response)
                guard let comics = comicsData.data?.results, comics.count >= 1 else {
                    failure("No result of characters in the search")
                    return
                }
                success(comics)
            } catch {
                failure("Failed to get API characters")
            }
        }, failure: { error in
            failure(error)
        })
    }
    
}
