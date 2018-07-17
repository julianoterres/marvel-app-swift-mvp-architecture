//
//  CharacterListViewModel.swift
//  Marvel
//
//  Created by Juliano Terres on 27/06/18.
//  Copyright © 2018 Juliano Terres. All rights reserved.
//

import UIKit
import Foundation

class CharacterListViewModel {
    
    private let service = CharacterService()
    private var offset = 0
    private var loadingActive = false
    var limit = 20
    var totalCharacters = 0
    var characters = [Character]()
    
    func load(success: @escaping() -> Void, failure: @escaping(_ error: String) -> Void) {
        if !self.loadingActive && !self.checkAlreadyLoadedAll() {
            self.service.getAllWithPagination(offset: String(offset),
                                                  limit: String(limit),
                                                  success: { [weak self] (characters, totalCharacters) in
                self?.totalCharacters = totalCharacters
                self?.characters.append(contentsOf: characters)
                self?.loadingActive = false
                self?.offset += self?.limit ?? 0
                success()
            }, failure: { [weak self] error in
                self?.loadingActive = false
                failure(error)
            })
            loadingActive = true
        }
    }
    
    func get(index: Int) -> Character {
        return self.characters[index]
    }
    
    func count() -> Int {
        return self.characters.count
    }
    
    func checkAlreadyLoadedAll() -> Bool {
        if self.totalCharacters > 0 && self.characters.count >= self.totalCharacters {
            return true
        }
        return false
    }
    
}
