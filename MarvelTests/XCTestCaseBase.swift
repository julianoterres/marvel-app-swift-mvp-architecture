//
//  XCTestCaseBase.swift
//  MarvelTests
//
//  Created by Juliano Terres on 29/06/18.
//  Copyright © 2018 Juliano Terres. All rights reserved.
//

import XCTest
@testable import ObjectMapper
@testable import Marvel

class XCTestCaseBase: XCTestCase {
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func wait(seconds: Int, callback: @escaping () -> Void ) {
        let promise = expectation(description: "wait")
        let time = DispatchTime.now() + Double(seconds)
        DispatchQueue.main.asyncAfter(deadline: time) {
            promise.fulfill()
            callback()
        }
        waitForExpectations(timeout: Double(seconds + 2))
    }
    
    func getCharacter() -> Marvel.Character? {
        guard let file = Bundle(for: self.classForCoder).path(forResource: "CharactersDetailMock", ofType: "json") else {
            XCTFail("File CharactersDetailMock was not found")
            return nil
        }
        do {
            let json = try String(contentsOfFile: file)
            guard let character: Marvel.Character = Mapper<Marvel.Character>().map(JSONString: json) else {
                XCTFail("Failed to convert json to Character")
                return nil
            }
            return character
        } catch {
            XCTFail("Failed to convert data from the CharactersDetailMock file to string")
            return nil
        }
    }
    
    func getCharacters() -> [Marvel.Character]? {
        guard let file = Bundle(for: self.classForCoder).path(forResource: "CharactersListMock", ofType: "json") else {
            XCTFail("File CharactersListMock was not found")
            return nil
        }
        do {
            let json = try String(contentsOfFile: file)
            guard let characters: [Marvel.Character] = Mapper<Marvel.Character>().mapArray(JSONString: json) else {
                XCTFail("Failed to convert json to array of Character")
                return nil
            }
            return characters
        } catch {
            XCTFail("Failed to convert data from the CharactersListMock file to string")
            return nil
        }
    }
    
}
