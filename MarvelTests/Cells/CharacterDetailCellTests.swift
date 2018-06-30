//
//  CharacterDetailCellTests.swift
//  MarvelTests
//
//  Created by Juliano Terres on 29/06/18.
//  Copyright © 2018 Juliano Terres. All rights reserved.
//

import XCTest
@testable import ObjectMapper
@testable import Kingfisher
@testable import Marvel

class CharacterDetailCellTests: XCTestCaseBase {
    
    private var characterDetailCell = CharacterDetailCell()
    private var character: Marvel.Character!
    
    override func setUp() {
        super.setUp()
        guard let characterMock = getCharacter() else {
            XCTFail("Failed get character")
            return
        }
        character = characterMock
        characterDetailCell.character = character
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testCell() {
        XCTAssertTrue(characterDetailCell.descriptionExist())
        characterDetailCell.character.desc = nil
        XCTAssertFalse(characterDetailCell.descriptionExist())
    }
    
}

