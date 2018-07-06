//
//  CharacterServiceTests.swift
//  MarvelTests
//
//  Created by Juliano Terres on 03/07/18.
//  Copyright © 2018 Juliano Terres. All rights reserved.
//

import XCTest
@testable import Marvel

class CharacterServiceTests: XCTestCaseBase {
    
    private var characterService: CharacterService!
    
    override func setUp() {
        super.setUp()
        characterService = CharacterService()
    }
    
    override func tearDown() {
        super.tearDown()
        characterService = nil
    }
    
    func testGetAllWithPaginationWithReturnError() {
        characterService.getAllWithPagination(offset: "-99", limit: "1", success: { (characters, totalCharacters) in
            XCTAssertNotNil(characters)
            XCTAssertNotNil(totalCharacters)
        }, failure: { error in
            XCTAssertNotNil(error)
        })
    }
    
    func testGetAllWithPaginationWithReturnCharacters() {
        characterService.getAllWithPagination(offset: "1", limit: "1", success: { (characters, totalCharacters) in
            XCTAssertNotNil(characters)
            XCTAssertNotNil(totalCharacters)
        }, failure: { error in
            XCTAssertNotNil(error)
        })
    }
    
    func testGetAllWithPaginationWithReturnNoCharacters() {
        characterService.getAllWithPagination(offset: "9999", limit: "1", success: { (characters, totalCharacters) in
            XCTAssertNotNil(characters)
            XCTAssertNotNil(totalCharacters)
        }, failure: { error in
            XCTAssertNotNil(error)
        })
    }
    
}
