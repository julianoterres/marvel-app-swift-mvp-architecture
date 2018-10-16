//
//  CharacterListViewModel.swift
//  Marvel
//
//  Created by Juliano Terres on 27/06/18.
//  Copyright © 2018 Juliano Terres. All rights reserved.
//

import UIKit
import Foundation

class CharacterListPresenter: CharacterListPresenterProtocol {
    
    weak private var view: CharacterListViewControllerProtocol?
    private let service: CharacterServiceProtocol
    private var offset = 0
    private var loadingActive = false
    private var limit = 20
    private var totalCharacters = 0
    private var characters = [Character]()
    
    init(view: CharacterListViewControllerProtocol, service: CharacterServiceProtocol) {
        self.service = service
        self.view = view
    }
    
    func load() {
        if !self.loadingActive && !self.checkAlreadyLoadedAll() {
            self.loadingActive = true
            self.service.getAllWithPagination(offset: String(offset),
                                                  limit: String(limit),
                                                  success: { [weak self] characters, totalCharacters in
                self?.totalCharacters = totalCharacters
                self?.characters.append(contentsOf: characters)
                self?.loadingActive = false
                self?.offset += self?.limit ?? 0
                self?.view?.reloadCharacters(characters: self?.characters ?? [],
                                            hideLoader: self?.checkAlreadyLoadedAll() ?? false)
            }, failure: { [weak self] error in
                self?.loadingActive = false
                self?.view?.showError(message: error)
            })
        }
    }
    
    func checkAlreadyLoadedAll() -> Bool {
        if self.totalCharacters > 0 && self.characters.count >= self.totalCharacters {
            return true
        }
        return false
    }
    
}
