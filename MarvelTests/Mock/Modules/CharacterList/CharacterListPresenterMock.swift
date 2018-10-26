//
//  CharacterListPresenterTests.swift
//  MarvelTests
//
//  Created by Juliano Terres on 25/10/18.
//  Copyright © 2018 Juliano Terres. All rights reserved.
//

import Foundation
import UIKit
@testable import Marvel

class CharacterListPresenterMock: CharacterListPresenterProtocol {
    
    weak private var view: CharacterListViewControllerProtocol?
    private let service: CharacterServiceProtocol
    private var characters = [Marvel.Character]()
    
    init(view: CharacterListViewControllerProtocol, service: CharacterServiceProtocol) {
        self.service = service
        self.view = view
    }
    
    func load() {
        self.characters.append(contentsOf: CharacterMock.charactersWithAllData())
        self.view?.reloadCharacters(characters: self.characters, hideLoader: true)
    }
    
    func checkAlreadyLoadedAll() -> Bool {
        return false
    }
    
}
