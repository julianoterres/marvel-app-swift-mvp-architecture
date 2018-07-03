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
    
    private var characterListViewModel: CharacterListViewModel!
    private var characters: [Marvel.Character]!
    private var promise: XCTestExpectation!
    private var characterMock: CharacterMock!
    
    override func setUp() {
        super.setUp()
        characterMock = CharacterMock()
        characters = characterMock.charactersWithData()
        characterListViewModel = CharacterListViewModel()
        characterListViewModel.characters = characters
        characterListViewModel.totalCharacters = 0
    }
    
    override func tearDown() {
        super.tearDown()
        characterListViewModel = nil
        characters = nil
        promise = nil
        characterMock = nil
    }
    
    func testGetUserByRow() {
        XCTAssertEqual(characterListViewModel.get(index: 0), characters[0])
    }
    
    func testCount() {
        XCTAssertEqual(characterListViewModel.count(), characters.count)
    }
    
    func testCheckAlreadyLoadedAllFalse() {
        XCTAssertFalse(characterListViewModel.checkAlreadyLoadedAll())
    }
    
    func testCheckAlreadyLoadedAllTrue() {
        characterListViewModel.totalCharacters = characters.count
        XCTAssertTrue(characterListViewModel.checkAlreadyLoadedAll())
    }
    
    func testLoadSuccess() {
        promise = expectation(description: "waiting")
        characterListViewModel.load(success: { [weak self] in
            XCTAssert(true)
            self?.promise.fulfill()
        }) { [weak self] (error) in
            XCTAssertNotNil(error)
            self?.promise.fulfill()
        }
        waitForExpectations(timeout: 20.0, handler: nil)
    }
    
    func testLoadError() {
        promise = expectation(description: "waiting")
        characterListViewModel.limit = -99
        characterListViewModel.load(success: { [weak self] in
            XCTAssert(true)
            self?.promise.fulfill()
        }) { [weak self] (error) in
            XCTAssertNotNil(error)
            self?.promise.fulfill()
        }
        waitForExpectations(timeout: 20.0, handler: nil)
    }
    
}
