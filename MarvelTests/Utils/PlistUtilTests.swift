//
//  PlistUtilTests.swift
//  MarvelTests
//
//  Created by Juliano Terres on 17/10/18.
//  Copyright © 2018 Juliano Terres. All rights reserved.
//

import XCTest
@testable import Marvel

class PlistUtilTests: XCTestCaseBase {
    
    private var text: String!
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
        self.text = nil
    }
    
    func testReturnTrue() {
        self.text = PlistUtil.valueInfoToString(attribute: "API URL Base")
        XCTAssertNotNil(self.text)
    }
    
    func testReturnFalse() {
        self.text = PlistUtil.valueInfoToString(attribute: "XXX")
        XCTAssertNotNil(self.text)
    }
    
}
