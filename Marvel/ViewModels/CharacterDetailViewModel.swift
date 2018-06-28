//
//  CharacterDetailViewModel.swift
//  Marvel
//
//  Created by Juliano Terres on 27/06/18.
//  Copyright © 2018 Juliano Terres. All rights reserved.
//

import Foundation
import UIKit

class CharacterDetailViewModel {
    
    var character = Character()
    
    func getTableViewIdentifier(section: Int) -> String {
        switch section {
            case 0:
                return "image"
            case 2:
                return "title"
            default:
                return "text"
        }
    }
    
    func getTableViewHeightForRow(section: Int) -> CGFloat {
        switch section {
            case 0:
                return UIScreen.main.bounds.width * 0.6
            case 1:
                guard let desc = character.desc, desc != "" else {
                    return 0
                }
            case 2:
                guard let comics = character.comics, let itens = comics.items, itens.count != 0 else {
                    return 0
                }
            case 3:
                guard let comics = character.comics, let itens = comics.items, itens.count != 0 else {
                    return 0
                }
            default:
                return UITableViewAutomaticDimension
        }
        return UITableViewAutomaticDimension
    }
    
    func getTableViewNumberRows(section: Int) -> Int {
        var totalRows = 1
        if section == 3 {
            totalRows = character.comics?.items?.count ?? 0
        }
        return totalRows
    }
    
}
