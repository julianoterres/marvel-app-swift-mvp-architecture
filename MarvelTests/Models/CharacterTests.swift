//
//  CharacterTests.swift
//  MarvelTests
//
//  Created by Juliano Terres on 29/06/18.
//  Copyright © 2018 Juliano Terres. All rights reserved.
//

import XCTest
@testable import Marvel

class CharacterTests: XCTestCaseBase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testCharacterWithoutData() {
        let character = Character()
        XCTAssertNotNil(character)
        XCTAssertNil(character.getImage(size: .landscapeXlarge))
    }
    
    func testCharacterWithData() {
        guard let character = getCharacter() else {
            XCTFail("Failed get characters")
            return
        }
        XCTAssertNotNil(character.getImage(size: .landscapeXlarge))
    }
    
}
