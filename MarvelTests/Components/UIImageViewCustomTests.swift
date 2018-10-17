//
//  UIImageViewCustomTests.swift
//  MarvelTests
//
//  Created by Juliano Terres on 16/10/18.
//  Copyright © 2018 Juliano Terres. All rights reserved.
//

import XCTest
@testable import Marvel

class UIImageViewCustomTests: XCTestCaseBase {
    
    func testCornerRadius() {
        let view = UIImageViewCustom()
        view.cornerRadius = 10
        XCTAssertEqual(view.layer.cornerRadius, 10)
    }
    
}
