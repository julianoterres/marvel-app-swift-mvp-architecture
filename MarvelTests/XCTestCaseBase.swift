//
//  XCTestCaseBase.swift
//  MarvelTests
//
//  Created by Juliano Terres on 29/06/18.
//  Copyright © 2018 Juliano Terres. All rights reserved.
//

import XCTest
@testable import Marvel

class XCTestCaseBase: XCTestCase {
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func wait(seconds: Int, callback: @escaping () -> Void ) {
        let promise = expectation(description: "wait")
        let time = DispatchTime.now() + Double(seconds)
        DispatchQueue.main.asyncAfter(deadline: time) {
            callback()
            promise.fulfill()
        }
        waitForExpectations(timeout: Double(seconds + 2))
    }
    
}
