//
//  CharacterDetailViewModelTests.swift
//  MarvelTests
//
//  Created by Juliano Terres on 12/09/18.
//  Copyright © 2018 Juliano Terres. All rights reserved.
//

import XCTest
@testable import Marvel

class CharacterDetailPresenterTests: XCTestCaseBase {
    
    private var viewModel: CharacterDetailPresenter!
    
    override func tearDown() {
        super.tearDown()
        self.viewModel = nil
    }
    
//    func prepareViewController(returnType: EnumReturnType) {
//        if returnType == .success {
//            self.viewModel = CharacterDetailPresenter(character: CharacterMock.characterWithAllData())
//        } else {
//            self.viewModel = CharacterDetailPresenter(character: CharacterMock.characterWithoutData())
//        }
//    }
//    
//    func testGetTableViewIdentifier() {
//        self.prepareViewController(returnType: .success)
//        XCTAssertEqual(self.viewModel.getTableViewIdentifier(section: 0), CharacterDetailCellReusubleIdentifier.image.rawValue)
//        XCTAssertEqual(self.viewModel.getTableViewIdentifier(section: 1), CharacterDetailCellReusubleIdentifier.text.rawValue)
//        XCTAssertEqual(self.viewModel.getTableViewIdentifier(section: 2), CharacterDetailCellReusubleIdentifier.title.rawValue)
//        XCTAssertEqual(self.viewModel.getTableViewIdentifier(section: 3), CharacterDetailCellReusubleIdentifier.text.rawValue)
//    }
//    
//    func testGetTableViewHeightForRowUserWhitData() {
//        self.prepareViewController(returnType: .success)
//        XCTAssertEqual(self.viewModel.getTableViewHeightForRow(section: 0), UIScreen.main.bounds.width * 0.6)
//        XCTAssertEqual(self.viewModel.getTableViewHeightForRow(section: 1), UITableViewAutomaticDimension)
//        XCTAssertEqual(self.viewModel.getTableViewHeightForRow(section: 2), UITableViewAutomaticDimension)
//        XCTAssertEqual(self.viewModel.getTableViewHeightForRow(section: 3), UITableViewAutomaticDimension)
//        XCTAssertEqual(self.viewModel.getTableViewHeightForRow(section: 4), UITableViewAutomaticDimension)
//    }
//    
//    func testGetTableViewHeightForRowUserWhitoutData() {
//        self.prepareViewController(returnType: .error)
//        XCTAssertEqual(self.viewModel.getTableViewHeightForRow(section: 0), UIScreen.main.bounds.width * 0.6)
//        XCTAssertEqual(self.viewModel.getTableViewHeightForRow(section: 1), 0)
//        XCTAssertEqual(self.viewModel.getTableViewHeightForRow(section: 2), 0)
//        XCTAssertEqual(self.viewModel.getTableViewHeightForRow(section: 3), 0)
//    }
//    
//    func testGetTableViewNumberRowsUserWhitData() {
//        self.prepareViewController(returnType: .success)
//        XCTAssertEqual(self.viewModel.getTableViewNumberRows(section: 0), 1)
//        XCTAssertEqual(self.viewModel.getTableViewNumberRows(section: 1), 1)
//        XCTAssertEqual(self.viewModel.getTableViewNumberRows(section: 2), 1)
//        XCTAssertEqual(self.viewModel.getTableViewNumberRows(section: 3), self.viewModel.character.comics?.items?.count)
//    }
//    
//    func testGetTableViewNumberRowsUserWhitoutData() {
//        self.prepareViewController(returnType: .error)
//        XCTAssertEqual(self.viewModel.getTableViewNumberRows(section: 0), 1)
//        XCTAssertEqual(self.viewModel.getTableViewNumberRows(section: 1), 1)
//        XCTAssertEqual(self.viewModel.getTableViewNumberRows(section: 2), 1)
//        XCTAssertEqual(self.viewModel.getTableViewNumberRows(section: 3), 0)
//    }
    
}
