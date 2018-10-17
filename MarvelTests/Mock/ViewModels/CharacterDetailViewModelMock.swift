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

//class CharacterDetailViewModelMock: CharacterDetailPresenterProtocol {
//    
//    var character: Marvel.Character
//    
//    init(character: Marvel.Character) {
//        self.character = character
//    }
//    
//    func getTableViewIdentifier(section: Int) -> String {
//        switch section {
//        case CharacterDetailCellSection.banner.rawValue:
//            return CharacterDetailCellReusubleIdentifier.image.rawValue
//        case CharacterDetailCellSection.title.rawValue:
//            return CharacterDetailCellReusubleIdentifier.title.rawValue
//        default:
//            return CharacterDetailCellReusubleIdentifier.text.rawValue
//        }
//    }
//    
//    func getTableViewHeightForRow(section: Int) -> CGFloat {
//        switch section {
//        case CharacterDetailCellSection.banner.rawValue:
//            return UIScreen.main.bounds.width * 0.6
//        case CharacterDetailCellSection.description.rawValue:
//            guard let desc = character.description, !desc.isEmpty else {
//                return 0
//            }
//        case CharacterDetailCellSection.title.rawValue:
//            guard let comics = character.comics, let itens = comics.items, !itens.isEmpty else {
//                return 0
//            }
//        case CharacterDetailCellSection.itens.rawValue:
//            guard let comics = character.comics, let itens = comics.items, !itens.isEmpty else {
//                return 0
//            }
//        default:
//            return UITableViewAutomaticDimension
//        }
//        return UITableViewAutomaticDimension
//    }
//    
//    func getTableViewNumberRows(section: Int) -> Int {
//        switch section {
//        case CharacterDetailCellSection.itens.rawValue:
//            guard let itens = self.character.comics?.items else {
//                return 0
//            }
//            return itens.count
//        default:
//            return 1
//        }
//    }
//    
//}
