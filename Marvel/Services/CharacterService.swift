//
//  CharacterService.swift
//  Marvel
//
//  Created by Juliano Terres on 27/06/18.
//  Copyright © 2018 Juliano Terres. All rights reserved.
//

import ObjectMapper

class CharacterService {
    
    func getAllWithPagination(offset: String, limit: String, success: @escaping(_ characters: [Character], _ totalCharacters: Int) -> Void, failure: @escaping(_ message: String) -> Void) {
        let url = UrlDefinition.characters(offset: offset, limit: limit)
        
        Network.request(url: url, completion: { (response) in

            guard let data = response["data"] as? [String:Any], let results = data["results"] as? [[String : Any]] else {
                failure("Error in loading data of API")
                return
            }
            
            let characters : [Character] = Mapper<Character>().mapArray(JSONArray: results)
            let totalCharacters = data["total"] as? Int ?? 0
            
            success(characters, totalCharacters)
            
        }) { (error) in
            failure(error)
        }
    }
    
}
