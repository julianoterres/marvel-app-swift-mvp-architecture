//
//  UIImageExtensionTests.swift
//  MarvelTests
//
//  Created by Juliano Terres on 12/09/18.
//  Copyright © 2018 Juliano Terres. All rights reserved.
//

import XCTest
@testable import Marvel

class UIImageExtensionTests: XCTestCaseBase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testPlaceholdeAvatar() {
        XCTAssertEqual(UIImage.placeholderAvatar(), UIImage(named: "placeholderAvatar")!)
    }
    
    func testPlaceholdeBanner() {
        XCTAssertEqual(UIImage.placeholderBanner(), UIImage(named: "placeholderBanner")!)
    }
    
}
