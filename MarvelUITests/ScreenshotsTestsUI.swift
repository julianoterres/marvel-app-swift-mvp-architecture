//
//  Screenshots.swift
//  MarvelUITests
//
//  Created by Juliano Terres on 04/07/18.
//  Copyright © 2018 Juliano Terres. All rights reserved.
//

import XCTest

class ScreenshotsTestsUI: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        app = XCUIApplication()
        app.launch()
        setupSnapshot(app)
    }

    override func tearDown() {
        super.tearDown()
        app = nil
    }

    func testMakeScreenshots() {
        snapshot("0-List")
        let table = app.tables
        let cells = table.cells
        cells.element(boundBy: 4).tap()
        snapshot("1-Details")
    }

}
