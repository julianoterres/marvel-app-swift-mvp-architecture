//
//  Screenshots.swift
//  MarvelUITests
//
//  Created by Juliano Terres on 04/07/18.
//  Copyright © 2018 Juliano Terres. All rights reserved.
//

import XCTest

class ScreenshotsTestsUI: XCTestCase {

    //var app = XCUIApplication!
    
    override func setUp() {
        super.setUp()
        //app = XCUIApplication()
    }

    override func tearDown() {
        super.tearDown()
        //app = nil
    }

    func testMakeScreenshots() {
        let app = XCUIApplication()
        setupSnapshot(app)
        app.launch()
        snapshot("0-List")
        let table = XCUIApplication().tables
        table.element(boundBy: 0).tap()
        snapshot("1-Details")
    }

}
