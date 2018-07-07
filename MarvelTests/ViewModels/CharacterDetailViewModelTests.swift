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
    
    private var viewModel: CharacterDetailViewModel!
    private var mock: CharacterMock!
    private var character: Marvel.Character!
    
    override func setUp() {
        super.setUp()
        mock = CharacterMock()
        viewModel = CharacterDetailViewModel()
    }
    
    override func tearDown() {
        super.tearDown()
        viewModel = nil
        mock = nil
        character = nil
    }
    
    func setCharacterWithData() {
        character = mock.characterWithAllData()
        viewModel.character = character
    }
    
    func setCharacterWithoutData() {
        character = mock.characterWithoutData()
        viewModel.character = character
    }
    
    func testTableViewIdentifier() {
        XCTAssertEqual(viewModel.getTableViewIdentifier(section: EnumCharacterDetailCellSection.banner.rawValue), EnumCharacterDetailCellReusubleIdentifier.image.rawValue)
        XCTAssertEqual(viewModel.getTableViewIdentifier(section: EnumCharacterDetailCellSection.description.rawValue), EnumCharacterDetailCellReusubleIdentifier.text.rawValue)
        XCTAssertEqual(viewModel.getTableViewIdentifier(section: EnumCharacterDetailCellSection.title.rawValue), EnumCharacterDetailCellReusubleIdentifier.title.rawValue)
        XCTAssertEqual(viewModel.getTableViewIdentifier(section: EnumCharacterDetailCellSection.itens.rawValue), EnumCharacterDetailCellReusubleIdentifier.text.rawValue)
    }
    
    func testTableViewHeightForRowWithCharacterWithAllData() {
        setCharacterWithData()
        XCTAssertEqual(viewModel.getTableViewHeightForRow(section: EnumCharacterDetailCellSection.banner.rawValue), (UIScreen.main.bounds.width * 0.6))
        XCTAssertEqual(viewModel.getTableViewHeightForRow(section: EnumCharacterDetailCellSection.description.rawValue), UITableViewAutomaticDimension)
        XCTAssertEqual(viewModel.getTableViewHeightForRow(section: EnumCharacterDetailCellSection.title.rawValue), UITableViewAutomaticDimension)
        XCTAssertEqual(viewModel.getTableViewHeightForRow(section: EnumCharacterDetailCellSection.itens.rawValue), UITableViewAutomaticDimension)
        XCTAssertEqual(viewModel.getTableViewHeightForRow(section: EnumCharacterDetailCellSection.itens.rawValue + 1), UITableViewAutomaticDimension)
    }
    
    func testTableViewNumberRowsWithCharacterWithAllData() {
        setCharacterWithData()
        XCTAssertEqual(viewModel.getTableViewNumberRows(section: EnumCharacterDetailCellSection.banner.rawValue), 1)
        XCTAssertEqual(viewModel.getTableViewNumberRows(section: EnumCharacterDetailCellSection.description.rawValue), 1)
        XCTAssertEqual(viewModel.getTableViewNumberRows(section: EnumCharacterDetailCellSection.title.rawValue), 1)
        XCTAssertEqual(viewModel.getTableViewNumberRows(section: EnumCharacterDetailCellSection.itens.rawValue), character.comics?.items?.count)
    }
    
    func testTableViewHeightForRowWithCharacterWithoutData() {
        setCharacterWithoutData()
        XCTAssertEqual(viewModel.getTableViewHeightForRow(section: EnumCharacterDetailCellSection.banner.rawValue), (UIScreen.main.bounds.width * 0.6))
        XCTAssertEqual(viewModel.getTableViewHeightForRow(section: EnumCharacterDetailCellSection.description.rawValue), 0)
        XCTAssertEqual(viewModel.getTableViewHeightForRow(section: EnumCharacterDetailCellSection.title.rawValue), 0)
        XCTAssertEqual(viewModel.getTableViewHeightForRow(section: EnumCharacterDetailCellSection.itens.rawValue), 0)
        XCTAssertEqual(viewModel.getTableViewHeightForRow(section: EnumCharacterDetailCellSection.itens.rawValue + 1), UITableViewAutomaticDimension)
    }
    
    func testTableViewNumberRowsWithCharacterWithoutData() {
        setCharacterWithoutData()
        XCTAssertEqual(viewModel.getTableViewNumberRows(section: EnumCharacterDetailCellSection.banner.rawValue), 1)
        XCTAssertEqual(viewModel.getTableViewNumberRows(section: EnumCharacterDetailCellSection.description.rawValue), 1)
        XCTAssertEqual(viewModel.getTableViewNumberRows(section: EnumCharacterDetailCellSection.title.rawValue), 1)
        XCTAssertEqual(viewModel.getTableViewNumberRows(section: EnumCharacterDetailCellSection.itens.rawValue), 0)
    }
}
