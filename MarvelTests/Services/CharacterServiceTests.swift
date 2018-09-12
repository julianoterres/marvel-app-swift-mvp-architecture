//
//  CharacterServiceTests.swift
//  MarvelTests
//
//  Created by Juliano Terres on 12/09/18.
//  Copyright © 2018 Juliano Terres. All rights reserved.
//

import XCTest
@testable import Marvel

class CharacterServiceTests: XCTestCaseBase {
    
    private var service: CharacterService!
    
    override func setUp() {
        super.setUp()
        service = CharacterService()
    }
    
    override func tearDown() {
        super.tearDown()
        service = nil
    }
    
    func testGetAllWithPaginationWithReturnError() {
        self.wait(seconds: 20) {
            self.service.getAllWithPagination(offset: "-99", limit: "1", success: { (characters, totalCharacters) in
                XCTAssertNotNil(characters)
                XCTAssertNotNil(totalCharacters)
            }, failure: { error in
                XCTAssertNotNil(error)
            })
        }
    }
    
    func testGetAllWithPaginationWithReturnCharacters() {
        self.wait(seconds: 20) {
            self.service.getAllWithPagination(offset: "1", limit: "1", success: { (characters, totalCharacters) in
                XCTAssertNotNil(characters)
                XCTAssertNotNil(totalCharacters)
            }, failure: { error in
                XCTAssertNotNil(error)
            })
        }
    }
    
    func testGetAllWithPaginationWithReturnNoCharacters() {
        self.wait(seconds: 20) {
            self.service.getAllWithPagination(offset: "9999", limit: "1", success: { (characters, totalCharacters) in
                XCTAssertNotNil(characters)
                XCTAssertNotNil(totalCharacters)
            }, failure: { error in
                XCTAssertNotNil(error)
            })
        }
    }
    
}
