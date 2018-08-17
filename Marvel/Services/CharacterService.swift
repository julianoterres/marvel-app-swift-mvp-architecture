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
        let url = UrlDefinition.characters(offset: offset, limit: limit)
        Network.request(url: url, method: .get, parameters: nil, completion: { (response) in
            do {
                let characterData: CharacterData = try JSONDecoder().decode(CharacterData.self, from: response)
                guard let characters = characterData.data?.results, let totalCharacters = characterData.data?.total else {
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
    
}
