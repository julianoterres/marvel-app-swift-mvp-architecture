//
//  CharacterDetailViewModelTests.swift
//  MarvelTests
//
//  Created by Juliano Terres on 12/09/18.
//  Copyright © 2018 Juliano Terres. All rights reserved.
//

import XCTest
@testable import Marvel

class CharacterDetailViewModelTests: XCTestCaseBase {
    
    private var viewModel: CharacterDetailViewModel!
    
    override func tearDown() {
        super.tearDown()
        self.viewModel = nil
    }
    
    func prepareViewController(returnType: EnumReturnType) {
        if returnType == .success {
            self.viewModel = CharacterDetailViewModel(character: CharacterMock.characterWithAllData())
        } else {
            self.viewModel = CharacterDetailViewModel(character: CharacterMock.characterWithoutData())
        }
    }
    
    func testGetTableViewIdentifier() {
        self.prepareViewController(returnType: .success)
        XCTAssertEqual(self.viewModel.getTableViewIdentifier(section: 0), EnumCharacterDetailCellReusubleIdentifier.image.rawValue)
        XCTAssertEqual(self.viewModel.getTableViewIdentifier(section: 1), EnumCharacterDetailCellReusubleIdentifier.text.rawValue)
        XCTAssertEqual(self.viewModel.getTableViewIdentifier(section: 2), EnumCharacterDetailCellReusubleIdentifier.title.rawValue)
        XCTAssertEqual(self.viewModel.getTableViewIdentifier(section: 3), EnumCharacterDetailCellReusubleIdentifier.text.rawValue)
    }
    
    func testGetTableViewHeightForRowUserWhitData() {
        self.prepareViewController(returnType: .success)
        XCTAssertEqual(self.viewModel.getTableViewHeightForRow(section: 0), UIScreen.main.bounds.width * 0.6)
        XCTAssertEqual(self.viewModel.getTableViewHeightForRow(section: 1), UITableViewAutomaticDimension)
        XCTAssertEqual(self.viewModel.getTableViewHeightForRow(section: 2), UITableViewAutomaticDimension)
        XCTAssertEqual(self.viewModel.getTableViewHeightForRow(section: 3), UITableViewAutomaticDimension)
        XCTAssertEqual(self.viewModel.getTableViewHeightForRow(section: 4), UITableViewAutomaticDimension)
    }
    
    func testGetTableViewHeightForRowUserWhitoutData() {
        self.prepareViewController(returnType: .error)
        XCTAssertEqual(self.viewModel.getTableViewHeightForRow(section: 0), UIScreen.main.bounds.width * 0.6)
        XCTAssertEqual(self.viewModel.getTableViewHeightForRow(section: 1), 0)
        XCTAssertEqual(self.viewModel.getTableViewHeightForRow(section: 2), 0)
        XCTAssertEqual(self.viewModel.getTableViewHeightForRow(section: 3), 0)
    }
    
    func testGetTableViewNumberRowsUserWhitData() {
        self.prepareViewController(returnType: .success)
        XCTAssertEqual(self.viewModel.getTableViewNumberRows(section: 0), 1)
        XCTAssertEqual(self.viewModel.getTableViewNumberRows(section: 1), 1)
        XCTAssertEqual(self.viewModel.getTableViewNumberRows(section: 2), 1)
        XCTAssertEqual(self.viewModel.getTableViewNumberRows(section: 3), self.viewModel.character.comics?.items?.count)
    }
    
    func testGetTableViewNumberRowsUserWhitoutData() {
        self.prepareViewController(returnType: .error)
        XCTAssertEqual(self.viewModel.getTableViewNumberRows(section: 0), 1)
        XCTAssertEqual(self.viewModel.getTableViewNumberRows(section: 1), 1)
        XCTAssertEqual(self.viewModel.getTableViewNumberRows(section: 2), 1)
        XCTAssertEqual(self.viewModel.getTableViewNumberRows(section: 3), 0)
    }
    
}
