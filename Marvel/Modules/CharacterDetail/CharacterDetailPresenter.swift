//
//  CharacterDetailViewModel.swift
//  Marvel
//
//  Created by Juliano Terres on 27/06/18.
//  Copyright © 2018 Juliano Terres. All rights reserved.
//

import Foundation
import UIKit

class CharacterDetailPresenter: CharacterDetailPresenterProtocol {
    
    weak private var view: CharacterDetailViewControllerProtocol?
    private var character: Character
    private let service: CharacterServiceProtocol
    
    init(view: CharacterDetailViewControllerProtocol, service: CharacterServiceProtocol, character: Character) {
        self.view = view
        self.service = service
        self.character = character
    }
    
    func loadComics() {
        self.service.getComics(characterId: String(self.character.id!), success: { [weak self] comics in
            self?.character.listComics = comics
            self?.view?.showDetails(character: self?.character)
        }, failure: { [weak self] error in
            self?.view?.showError(message: error)
        })
    }
    
}
