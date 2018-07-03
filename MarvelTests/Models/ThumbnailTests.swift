//
//  ThumbnailTests.swift
//  MarvelTests
//
//  Created by Juliano Terres on 30/06/18.
//  Copyright © 2018 Juliano Terres. All rights reserved.
//

import XCTest
@testable import Marvel

class ThumbnailTests: XCTestCaseBase {
    
    private var thumbnail: Thumbnail!
    
    override func setUp() {
        super.setUp()
        thumbnail = Thumbnail()
    }
    
    override func tearDown() {
        super.tearDown()
        thumbnail = nil
    }
    
    func testThumbnailWithoutData() {
        XCTAssertNotNil(thumbnail)
    }
    
}
