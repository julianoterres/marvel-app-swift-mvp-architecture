//
//  ItemsTests.swift
//  MarvelTests
//
//  Created by Juliano Terres on 30/06/18.
//  Copyright © 2018 Juliano Terres. All rights reserved.
//

import XCTest
@testable import Marvel

class ItemsTests: XCTestCaseBase {
    
    private var items: Items!
    
    override func setUp() {
        super.setUp()
        items = Items()
    }
    
    override func tearDown() {
        super.tearDown()
        items = nil
    }
    
    func testItemsWithoutData() {
        XCTAssertNotNil(items)
    }
    
}
