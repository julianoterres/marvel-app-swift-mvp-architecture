//
//  CharacterDetailViewModelTests.swift
//  MarvelTests
//
//  Created by Juliano Terres on 29/06/18.
//  Copyright © 2018 Juliano Terres. All rights reserved.
//

import XCTest
@testable import Marvel

class CharacterDetailViewModelTests: XCTestCaseBase {
    
    private var characterDetailViewModel = CharacterDetailViewModel()
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testCharactersWithAllData() {
        guard let character = getCharacter() else {
            XCTFail("Failed get characters")
            return
        }
        
        characterDetailViewModel.character = character
        
        XCTAssertEqual(characterDetailViewModel.getTableViewIdentifier(section: EnumCharacterDetailCellSection.banner.rawValue), EnumCharacterDetailCellReusubleIdentifier.image.rawValue)
        XCTAssertEqual(characterDetailViewModel.getTableViewIdentifier(section: EnumCharacterDetailCellSection.description.rawValue), EnumCharacterDetailCellReusubleIdentifier.text.rawValue)
        XCTAssertEqual(characterDetailViewModel.getTableViewIdentifier(section: EnumCharacterDetailCellSection.title.rawValue), EnumCharacterDetailCellReusubleIdentifier.title.rawValue)
        XCTAssertEqual(characterDetailViewModel.getTableViewIdentifier(section: EnumCharacterDetailCellSection.itens.rawValue), EnumCharacterDetailCellReusubleIdentifier.text.rawValue)
        
        XCTAssertEqual(characterDetailViewModel.getTableViewHeightForRow(section: EnumCharacterDetailCellSection.banner.rawValue), (UIScreen.main.bounds.width * 0.6))
        XCTAssertEqual(characterDetailViewModel.getTableViewHeightForRow(section: EnumCharacterDetailCellSection.description.rawValue), UITableViewAutomaticDimension)
        XCTAssertEqual(characterDetailViewModel.getTableViewHeightForRow(section: EnumCharacterDetailCellSection.title.rawValue), UITableViewAutomaticDimension)
        XCTAssertEqual(characterDetailViewModel.getTableViewHeightForRow(section: EnumCharacterDetailCellSection.itens.rawValue), UITableViewAutomaticDimension)
        XCTAssertEqual(characterDetailViewModel.getTableViewHeightForRow(section: EnumCharacterDetailCellSection.itens.rawValue + 1), UITableViewAutomaticDimension)
        
        XCTAssertEqual(characterDetailViewModel.getTableViewNumberRows(section: EnumCharacterDetailCellSection.banner.rawValue), 1)
        XCTAssertEqual(characterDetailViewModel.getTableViewNumberRows(section: EnumCharacterDetailCellSection.description.rawValue), 1)
        XCTAssertEqual(characterDetailViewModel.getTableViewNumberRows(section: EnumCharacterDetailCellSection.title.rawValue), 1)
        XCTAssertEqual(characterDetailViewModel.getTableViewNumberRows(section: EnumCharacterDetailCellSection.itens.rawValue), character.comics?.items?.count)
        
        characterDetailViewModel.character.comics = nil
        characterDetailViewModel.character.desc = ""
        
        XCTAssertEqual(characterDetailViewModel.getTableViewIdentifier(section: EnumCharacterDetailCellSection.banner.rawValue), EnumCharacterDetailCellReusubleIdentifier.image.rawValue)
        XCTAssertEqual(characterDetailViewModel.getTableViewIdentifier(section: EnumCharacterDetailCellSection.description.rawValue), EnumCharacterDetailCellReusubleIdentifier.text.rawValue)
        XCTAssertEqual(characterDetailViewModel.getTableViewIdentifier(section: EnumCharacterDetailCellSection.title.rawValue), EnumCharacterDetailCellReusubleIdentifier.title.rawValue)
        XCTAssertEqual(characterDetailViewModel.getTableViewIdentifier(section: EnumCharacterDetailCellSection.itens.rawValue), EnumCharacterDetailCellReusubleIdentifier.text.rawValue)
        
        XCTAssertEqual(characterDetailViewModel.getTableViewHeightForRow(section: EnumCharacterDetailCellSection.banner.rawValue), (UIScreen.main.bounds.width * 0.6))
        XCTAssertEqual(characterDetailViewModel.getTableViewHeightForRow(section: EnumCharacterDetailCellSection.description.rawValue), 0)
        XCTAssertEqual(characterDetailViewModel.getTableViewHeightForRow(section: EnumCharacterDetailCellSection.title.rawValue), 0)
        XCTAssertEqual(characterDetailViewModel.getTableViewHeightForRow(section: EnumCharacterDetailCellSection.itens.rawValue), 0)
        XCTAssertEqual(characterDetailViewModel.getTableViewHeightForRow(section: EnumCharacterDetailCellSection.itens.rawValue + 1), UITableViewAutomaticDimension)
        
        XCTAssertEqual(characterDetailViewModel.getTableViewNumberRows(section: EnumCharacterDetailCellSection.banner.rawValue), 1)
        XCTAssertEqual(characterDetailViewModel.getTableViewNumberRows(section: EnumCharacterDetailCellSection.description.rawValue), 1)
        XCTAssertEqual(characterDetailViewModel.getTableViewNumberRows(section: EnumCharacterDetailCellSection.title.rawValue), 1)
        XCTAssertEqual(characterDetailViewModel.getTableViewNumberRows(section: EnumCharacterDetailCellSection.itens.rawValue), 0)
    }
    
}
