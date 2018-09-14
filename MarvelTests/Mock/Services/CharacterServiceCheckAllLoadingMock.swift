//
//  CharacterServiceCheckAllLoadingMock.swift
//  MarvelTests
//
//  Created by Juliano Terres on 12/09/18.
//  Copyright © 2018 Juliano Terres. All rights reserved.
//

import Foundation
import UIKit
@testable import Marvel

class CharacterServiceCheckAllLoadingMock: CharacterServiceProtocol {
    
    func getAllWithPagination(offset: String, limit: String, success: @escaping(_ characters: [Marvel.Character], _ totalCharacters: Int) -> Void, failure: @escaping(_ message: String) -> Void) {
        let characters = CharacterMock.charactersWithAllData()
        success(characters, 100)
    }
    
}
