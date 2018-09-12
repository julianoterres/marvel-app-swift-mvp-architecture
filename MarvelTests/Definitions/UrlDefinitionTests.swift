//
//  UrlDefinitionTests.swift
//  MarvelTests
//
//  Created by Juliano Terres on 12/09/18.
//  Copyright © 2018 Juliano Terres. All rights reserved.
//

import XCTest
@testable import Marvel

class UrlDefinitionTests: XCTestCaseBase {
    
    private let apiBaseURl: String = PlistUtil.valueInfoToString(attribute: "API URL Base") ?? ""
    private let apiKey: String = PlistUtil.valueInfoToString(attribute: "API Key") ?? ""
    private let apiHash: String = PlistUtil.valueInfoToString(attribute: "API Hash") ?? ""
    private let apiTs: String = PlistUtil.valueInfoToString(attribute: "API Ts") ?? ""
    
    func testUrlCharacters() {
        let urlCheck = UrlDefinition.characters(offset: "1", limit: "20").absoluteString
        let urlMock =  self.apiBaseURl + "characters?apikey=" + apiKey + "&hash=" + apiHash + "&ts=" + apiTs + "&offset=1&limit=20"
        XCTAssertEqual(urlCheck, urlMock)
    }
    
    func testUrlError() {
        let urlCheck = UrlDefinition.testError().absoluteString
        let urlMock =  self.apiBaseURl + "testeError?apikey=" + apiKey + "&hash=" + apiHash + "&ts=" + apiTs
        XCTAssertEqual(urlCheck, urlMock)
    }
    
}
