//
//  UrlExtensionTests.swift
//  MarvelTests
//
//  Created by Juliano Terres on 16/10/18.
//  Copyright © 2018 Juliano Terres. All rights reserved.
//

import XCTest
@testable import Marvel

class UrlExtensionTests: XCTestCaseBase {
    
    let apiBaseURl: String = PlistUtil.valueInfoToString(attribute: "API URL Base") ?? ""
    let apiKey: String = PlistUtil.valueInfoToString(attribute: "API Key") ?? ""
    let apiHash: String = PlistUtil.valueInfoToString(attribute: "API Hash") ?? ""
    let apiTs: String = PlistUtil.valueInfoToString(attribute: "API Ts") ?? ""
    
    func testUrlCharacters() {
        let url = URL.characters(offset: "0", limit: "10")
        let urlCheck = URL.init(string: apiBaseURl + "characters" + "?apikey=" + apiKey + "&hash=" + apiHash + "&ts=" + apiTs + "&offset=0&limit=10")
        XCTAssertEqual(url, urlCheck)
    }
    
    func testUrlComics() {
        let url = URL.comics(characterId: "100")
        let urlCheck = URL.init(string: apiBaseURl + "characters/100/comics" + "?apikey=" + apiKey + "&hash=" + apiHash + "&ts=" + apiTs)
        XCTAssertEqual(url, urlCheck)
    }
    
    func testUrlError() {
        let url = URL.testError()
        let urlCheck = URL.init(string: apiBaseURl + "testeError" + "?apikey=" + apiKey + "&hash=" + apiHash + "&ts=" + apiTs)
        XCTAssertEqual(url, urlCheck)
    }
    
}
