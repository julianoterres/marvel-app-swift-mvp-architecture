//
//  ComicsTests.swift
//  MarvelTests
//
//  Created by Juliano Terres on 30/06/18.
//  Copyright © 2018 Juliano Terres. All rights reserved.
//

import XCTest
@testable import Marvel

class ComicsTests: XCTestCaseBase {
    
    private var comics: Comics!
    
    override func setUp() {
        super.setUp()
        comics = Comics()
    }
    
    override func tearDown() {
        super.tearDown()
        comics = nil
    }
    
    func testComicsWithoutData() {
        XCTAssertNotNil(comics)
    }
    
}
