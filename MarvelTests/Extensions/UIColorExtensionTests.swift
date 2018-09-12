//
//  UIColorExtensionTests.swift
//  MarvelTests
//
//  Created by Juliano Terres on 12/09/18.
//  Copyright © 2018 Juliano Terres. All rights reserved.
//

import XCTest
@testable import Marvel

class UIColorExtensionTests: XCTestCaseBase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testColors() {
        XCTAssertEqual(UIColor.mineShaft, UIColor.init(red: 0.19, green: 0.19, blue: 0.19, alpha: 1.0))
        XCTAssertEqual(UIColor.shiraz, UIColor.init(red: 0.71, green: 0.06, blue: 0.09, alpha: 1.0))
        XCTAssertEqual(UIColor.silver, UIColor.init(red: 0.35, green: 0.35, blue: 0.35, alpha: 1.0))
    }
    
}
