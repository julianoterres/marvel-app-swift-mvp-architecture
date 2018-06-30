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
        
        XCTAssertEqual(characterDetailViewModel.getTableViewIdentifier(section: EnumCharacterDetailCellSection.banner.rawValue), EnumCharacterDetailCellReusubleIdentifier.image.rawValue, "Banner identifier is not the same as it should be")
        XCTAssertEqual(characterDetailViewModel.getTableViewIdentifier(section: EnumCharacterDetailCellSection.description.rawValue), EnumCharacterDetailCellReusubleIdentifier.text.rawValue, "Description identifier is not the same as it should be")
        XCTAssertEqual(characterDetailViewModel.getTableViewIdentifier(section: EnumCharacterDetailCellSection.title.rawValue), EnumCharacterDetailCellReusubleIdentifier.title.rawValue, "Comics title identifier is not the same as it should be")
        XCTAssertEqual(characterDetailViewModel.getTableViewIdentifier(section: EnumCharacterDetailCellSection.itens.rawValue), EnumCharacterDetailCellReusubleIdentifier.text.rawValue, "Comics itens identifier is not the same as it should be")
        
        XCTAssertEqual(characterDetailViewModel.getTableViewHeightForRow(section: EnumCharacterDetailCellSection.banner.rawValue), (UIScreen.main.bounds.width * 0.6), "Banner cell height is not equal to what should be")
        XCTAssertEqual(characterDetailViewModel.getTableViewHeightForRow(section: EnumCharacterDetailCellSection.description.rawValue), UITableViewAutomaticDimension, "Description cell height is not equal to what should be")
        XCTAssertEqual(characterDetailViewModel.getTableViewHeightForRow(section: EnumCharacterDetailCellSection.title.rawValue), UITableViewAutomaticDimension, "Comics title cell height is not equal to what should be")
        XCTAssertEqual(characterDetailViewModel.getTableViewHeightForRow(section: EnumCharacterDetailCellSection.itens.rawValue), UITableViewAutomaticDimension, "Comics item cell height is not equal to what should be")
        
        XCTAssertEqual(characterDetailViewModel.getTableViewNumberRows(section: EnumCharacterDetailCellSection.banner.rawValue), 1, "Number of lines of the banner session is not equal to what should be")
        XCTAssertEqual(characterDetailViewModel.getTableViewNumberRows(section: EnumCharacterDetailCellSection.description.rawValue), 1, "Number of lines of the description session is not equal to what should be")
        XCTAssertEqual(characterDetailViewModel.getTableViewNumberRows(section: EnumCharacterDetailCellSection.title.rawValue), 1, "Number of lines of the comics title session is not equal to what should be")
        XCTAssertEqual(characterDetailViewModel.getTableViewNumberRows(section: EnumCharacterDetailCellSection.itens.rawValue), character.comics?.items?.count, "Number of lines of the comics item session is not equal to what should be")
        
        characterDetailViewModel.character.comics?.items = [Items]()
        characterDetailViewModel.character.desc = ""
        
        XCTAssertEqual(characterDetailViewModel.getTableViewIdentifier(section: EnumCharacterDetailCellSection.banner.rawValue), EnumCharacterDetailCellReusubleIdentifier.image.rawValue, "Banner identifier is not the same as it should be")
        XCTAssertEqual(characterDetailViewModel.getTableViewIdentifier(section: EnumCharacterDetailCellSection.description.rawValue), EnumCharacterDetailCellReusubleIdentifier.text.rawValue, "Description identifier is not the same as it should be")
        XCTAssertEqual(characterDetailViewModel.getTableViewIdentifier(section: EnumCharacterDetailCellSection.title.rawValue), EnumCharacterDetailCellReusubleIdentifier.title.rawValue, "Comics title identifier is not the same as it should be")
        XCTAssertEqual(characterDetailViewModel.getTableViewIdentifier(section: EnumCharacterDetailCellSection.itens.rawValue), EnumCharacterDetailCellReusubleIdentifier.text.rawValue, "Comics itens identifier is not the same as it should be")
        
        XCTAssertEqual(characterDetailViewModel.getTableViewHeightForRow(section: EnumCharacterDetailCellSection.banner.rawValue), (UIScreen.main.bounds.width * 0.6), "Banner cell height is not equal to what should be")
        XCTAssertEqual(characterDetailViewModel.getTableViewHeightForRow(section: EnumCharacterDetailCellSection.description.rawValue), 0, "Description cell height is not equal to what should be")
        XCTAssertEqual(characterDetailViewModel.getTableViewHeightForRow(section: EnumCharacterDetailCellSection.title.rawValue), 0, "Comics title cell height is not equal to what should be")
        XCTAssertEqual(characterDetailViewModel.getTableViewHeightForRow(section: EnumCharacterDetailCellSection.itens.rawValue), 0, "Comics item cell height is not equal to what should be")
        
        XCTAssertEqual(characterDetailViewModel.getTableViewNumberRows(section: EnumCharacterDetailCellSection.banner.rawValue), 1, "Number of lines of the banner session is not equal to what should be")
        XCTAssertEqual(characterDetailViewModel.getTableViewNumberRows(section: EnumCharacterDetailCellSection.description.rawValue), 1, "Number of lines of the description session is not equal to what should be")
        XCTAssertEqual(characterDetailViewModel.getTableViewNumberRows(section: EnumCharacterDetailCellSection.title.rawValue), 1, "Number of lines of the comics title session is not equal to what should be")
        XCTAssertEqual(characterDetailViewModel.getTableViewNumberRows(section: EnumCharacterDetailCellSection.itens.rawValue), character.comics?.items?.count, "Number of lines of the comics item session is not equal to what should be")
    }
    
}
