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
    
    private var mock: CharacterMock!
    private var character: Marvel.Character!
    
    override func setUp() {
        super.setUp()
        mock = CharacterMock()
    }
    
    override func tearDown() {
        super.tearDown()
        mock = nil
        character = nil
    }
    
    func testCharacterWithoutData() {
        character = mock.characterWithoutData()
        XCTAssertNotNil(character)
        XCTAssertNil(character.getImage(size: .landscapeXlarge))
    }
    
    func testCharacterWithData() {
        character = mock.characterWithAllData()
        XCTAssertNotNil(character.getImage(size: .landscapeXlarge))
    }
    
}
