//
//  CharacterListViewModelTests.swift
//  MarvelTests
//
//  Created by Juliano Terres on 29/06/18.
//  Copyright © 2018 Juliano Terres. All rights reserved.
//

import XCTest
@testable import Marvel

class CharacterListViewModelTests: XCTestCaseBase {
    
    private var viewModel: CharacterListViewModel!
    private var characters: [Marvel.Character]!
    private var promise: XCTestExpectation!
    private var mock: CharacterMock!
    
    override func setUp() {
        super.setUp()
        mock = CharacterMock()
        characters = mock.charactersWithData()
        viewModel = CharacterListViewModel()
        viewModel.characters = characters
        viewModel.totalCharacters = 0
    }
    
    override func tearDown() {
        super.tearDown()
        viewModel = nil
        characters = nil
        promise = nil
        mock = nil
    }
    
    func testGetUserByRow() {
        XCTAssertEqual(viewModel.get(index: 0), characters[0])
    }
    
    func testCount() {
        XCTAssertEqual(viewModel.count(), characters.count)
    }
    
    func testCheckAlreadyLoadedAllFalse() {
        XCTAssertFalse(viewModel.checkAlreadyLoadedAll())
    }
    
    func testCheckAlreadyLoadedAllTrue() {
        viewModel.totalCharacters = characters.count
        XCTAssertTrue(viewModel.checkAlreadyLoadedAll())
    }
    
    func testLoadSuccess() {
        promise = expectation(description: "waiting")
        viewModel.load(success: { [weak self] in
            XCTAssert(true)
            self?.promise.fulfill()
        }, failure: { [weak self] error in
            XCTAssertNotNil(error)
            self?.promise.fulfill()
        })
        waitForExpectations(timeout: 20.0, handler: nil)
    }
    
    func testLoadError() {
        promise = expectation(description: "waiting")
        viewModel.limit = -99
        viewModel.load(success: { [weak self] in
            XCTAssert(true)
            self?.promise.fulfill()
        }, failure: { [weak self] error in
            XCTAssertNotNil(error)
            self?.promise.fulfill()
        })
        waitForExpectations(timeout: 20.0, handler: nil)
    }
    
}
