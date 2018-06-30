//
//  NetworkTests.swift
//  MarvelTests
//
//  Created by Juliano Terres on 30/06/18.
//  Copyright © 2018 Juliano Terres. All rights reserved.
//

import XCTest
@testable import Marvel

class NetworkTests: XCTestCaseBase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testNetwork() {
        let url = UrlDefinition.characters(offset: "0", limit: "1")
        let promise = expectation(description: "waiting")
        Network.request(url: url, completion: { (response) in
            XCTAssertNotNil(response)
            promise.fulfill()
        }) { (error) in
            XCTAssertNotNil(error)
        }
        waitForExpectations(timeout: 20.0, handler: nil)
    }
    
}
