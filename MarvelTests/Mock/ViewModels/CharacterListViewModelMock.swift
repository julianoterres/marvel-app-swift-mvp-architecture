//
//  CharacterListViewModelMock.swift
//  MarvelTests
//
//  Created by Juliano Terres on 10/09/18.
//  Copyright © 2018 Juliano Terres. All rights reserved.
//

import Foundation
import UIKit
@testable import Marvel

class CharacterListViewModelMock: CharacterListViewModelProtocol {
    
    var totalCharacters = 0
    var characters = [Marvel.Character]()
    var returnType: EnumReturnType!
    
    init(returnType: EnumReturnType) {
        self.returnType = returnType
    }
    
    func load(success: @escaping () -> Void, failure: @escaping (String) -> Void) {
        if self.returnType == .success {
            self.characters.append(contentsOf: CharacterMock.charactersWithAllData())
            self.totalCharacters  = self.characters.count
            success()
        } else {
            failure("Error")
        }
        
    }
    
    func get(index: Int) -> Marvel.Character {
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
