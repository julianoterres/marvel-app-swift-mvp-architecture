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
    
    private var characterListViewModel = CharacterListViewModel()
    private var characters: [Marvel.Character]!
    
    override func setUp() {
        super.setUp()
        
        guard let charactersMock = getCharacters() else {
            XCTFail("Failed get characters")
            return
        }
        
        characters = charactersMock
        characterListViewModel.characters = characters
        characterListViewModel.totalCharacters = 0
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testViewModel() {
        XCTAssertEqual(characterListViewModel.get(index: 0), characters[0])
        XCTAssertEqual(characterListViewModel.count(), characters.count)
        XCTAssertFalse(characterListViewModel.checkAlreadyLoadedAll())
        XCTAssertEqual(characterListViewModel.heightFooter(), 44)
        
        characterListViewModel.totalCharacters = characters.count
        
        XCTAssertTrue(characterListViewModel.checkAlreadyLoadedAll())
        XCTAssertEqual(characterListViewModel.heightFooter(), 0)
    }
    
}
