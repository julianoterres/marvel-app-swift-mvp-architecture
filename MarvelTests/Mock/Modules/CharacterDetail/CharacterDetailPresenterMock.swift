//
//  CharacterDetailPresenterMock.swift
//  MarvelTests
//
//  Created by Juliano Terres on 08/08/18.
//  Copyright © 2018 Juliano Terres. All rights reserved.
//

import Foundation
import UIKit
@testable import Marvel

class CharacterDetailPresenterMock: CharacterDetailPresenterProtocol {
    
    weak private var view: CharacterDetailViewControllerProtocol?
    private var character: Marvel.Character
    private let service: CharacterServiceProtocol
    
    init(view: CharacterDetailViewControllerProtocol, service: CharacterServiceProtocol, character: Marvel.Character) {
        self.view = view
        self.service = service
        self.character = character
    }
    
    func loadComics() {
        self.character.listComics = CharacterMock.getComics()
        self.view?.showDetails(character: self.character)
    }
    
}
