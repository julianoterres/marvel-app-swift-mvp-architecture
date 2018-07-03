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
    
    private var characterDetailViewModel: CharacterDetailViewModel!
    private var characterMock: CharacterMock!
    private var character: Marvel.Character!
    
    override func setUp() {
        super.setUp()
        characterMock = CharacterMock()
        characterDetailViewModel = CharacterDetailViewModel()
    }
    
    override func tearDown() {
        super.tearDown()
        characterDetailViewModel = nil
        characterMock = nil
        character = nil
    }
    
    func setCharacterWithData() {
        character = characterMock.characterWithAllData()
        characterDetailViewModel.character = character
    }
    
    func setCharacterWithoutData() {
        character = characterMock.characterWithoutData()
        characterDetailViewModel.character = character
    }
    
    func testTableViewIdentifier() {
        XCTAssertEqual(characterDetailViewModel.getTableViewIdentifier(section: EnumCharacterDetailCellSection.banner.rawValue), EnumCharacterDetailCellReusubleIdentifier.image.rawValue)
        XCTAssertEqual(characterDetailViewModel.getTableViewIdentifier(section: EnumCharacterDetailCellSection.description.rawValue), EnumCharacterDetailCellReusubleIdentifier.text.rawValue)
        XCTAssertEqual(characterDetailViewModel.getTableViewIdentifier(section: EnumCharacterDetailCellSection.title.rawValue), EnumCharacterDetailCellReusubleIdentifier.title.rawValue)
        XCTAssertEqual(characterDetailViewModel.getTableViewIdentifier(section: EnumCharacterDetailCellSection.itens.rawValue), EnumCharacterDetailCellReusubleIdentifier.text.rawValue)
    }
    
    func testTableViewHeightForRowWithCharacterWithAllData() {
        setCharacterWithData()
        XCTAssertEqual(characterDetailViewModel.getTableViewHeightForRow(section: EnumCharacterDetailCellSection.banner.rawValue), (UIScreen.main.bounds.width * 0.6))
        XCTAssertEqual(characterDetailViewModel.getTableViewHeightForRow(section: EnumCharacterDetailCellSection.description.rawValue), UITableViewAutomaticDimension)
        XCTAssertEqual(characterDetailViewModel.getTableViewHeightForRow(section: EnumCharacterDetailCellSection.title.rawValue), UITableViewAutomaticDimension)
        XCTAssertEqual(characterDetailViewModel.getTableViewHeightForRow(section: EnumCharacterDetailCellSection.itens.rawValue), UITableViewAutomaticDimension)
        XCTAssertEqual(characterDetailViewModel.getTableViewHeightForRow(section: EnumCharacterDetailCellSection.itens.rawValue + 1), UITableViewAutomaticDimension)
    }
    
    func testTableViewNumberRowsWithCharacterWithAllData() {
        setCharacterWithData()
        XCTAssertEqual(characterDetailViewModel.getTableViewNumberRows(section: EnumCharacterDetailCellSection.banner.rawValue), 1)
        XCTAssertEqual(characterDetailViewModel.getTableViewNumberRows(section: EnumCharacterDetailCellSection.description.rawValue), 1)
        XCTAssertEqual(characterDetailViewModel.getTableViewNumberRows(section: EnumCharacterDetailCellSection.title.rawValue), 1)
        XCTAssertEqual(characterDetailViewModel.getTableViewNumberRows(section: EnumCharacterDetailCellSection.itens.rawValue), character.comics?.items?.count)
    }
    
    func testTableViewHeightForRowWithCharacterWithoutData() {
        setCharacterWithoutData()
        XCTAssertEqual(characterDetailViewModel.getTableViewHeightForRow(section: EnumCharacterDetailCellSection.banner.rawValue), (UIScreen.main.bounds.width * 0.6))
        XCTAssertEqual(characterDetailViewModel.getTableViewHeightForRow(section: EnumCharacterDetailCellSection.description.rawValue), 0)
        XCTAssertEqual(characterDetailViewModel.getTableViewHeightForRow(section: EnumCharacterDetailCellSection.title.rawValue), 0)
        XCTAssertEqual(characterDetailViewModel.getTableViewHeightForRow(section: EnumCharacterDetailCellSection.itens.rawValue), 0)
        XCTAssertEqual(characterDetailViewModel.getTableViewHeightForRow(section: EnumCharacterDetailCellSection.itens.rawValue + 1), UITableViewAutomaticDimension)
    }
    
    func testTableViewNumberRowsWithCharacterWithoutData() {
        setCharacterWithoutData()
        XCTAssertEqual(characterDetailViewModel.getTableViewNumberRows(section: EnumCharacterDetailCellSection.banner.rawValue), 1)
        XCTAssertEqual(characterDetailViewModel.getTableViewNumberRows(section: EnumCharacterDetailCellSection.description.rawValue), 1)
        XCTAssertEqual(characterDetailViewModel.getTableViewNumberRows(section: EnumCharacterDetailCellSection.title.rawValue), 1)
        XCTAssertEqual(characterDetailViewModel.getTableViewNumberRows(section: EnumCharacterDetailCellSection.itens.rawValue), 0)
    }
}
