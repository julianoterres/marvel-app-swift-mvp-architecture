//
//  CharacterDetailViewModelMock.swift
//  MarvelTests
//
//  Created by Juliano Terres on 08/08/18.
//  Copyright © 2018 Juliano Terres. All rights reserved.
//

import Foundation
import UIKit
@testable import Marvel

class CharacterDetailViewModelMock: CharacterDetailViewModelProtocol {
    
    var character: Marvel.Character
    
    init(character: Marvel.Character) {
        self.character = character
    }
    
    func getTableViewIdentifier(section: Int) -> String {
        switch section {
        case EnumCharacterDetailCellSection.banner.rawValue:
            return EnumCharacterDetailCellReusubleIdentifier.image.rawValue
        case EnumCharacterDetailCellSection.title.rawValue:
            return EnumCharacterDetailCellReusubleIdentifier.title.rawValue
        default:
            return EnumCharacterDetailCellReusubleIdentifier.text.rawValue
        }
    }
    
    func getTableViewHeightForRow(section: Int) -> CGFloat {
        switch section {
        case EnumCharacterDetailCellSection.banner.rawValue:
            return UIScreen.main.bounds.width * 0.6
        case EnumCharacterDetailCellSection.description.rawValue:
            guard let desc = character.description, !desc.isEmpty else {
                return 0
            }
        case EnumCharacterDetailCellSection.title.rawValue:
            guard let comics = character.comics, let itens = comics.items, !itens.isEmpty else {
                return 0
            }
        case EnumCharacterDetailCellSection.itens.rawValue:
            guard let comics = character.comics, let itens = comics.items, !itens.isEmpty else {
                return 0
            }
        default:
            return UITableViewAutomaticDimension
        }
        return UITableViewAutomaticDimension
    }
    
    func getTableViewNumberRows(section: Int) -> Int {
        switch section {
        case EnumCharacterDetailCellSection.itens.rawValue:
            guard let itens = self.character.comics?.items else {
                return 0
            }
            return itens.count
        default:
            return 1
        }
    }
    
}
