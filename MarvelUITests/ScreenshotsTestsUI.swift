//
//  Screenshots.swift
//  MarvelUITests
//
//  Created by Juliano Terres on 04/07/18.
//  Copyright © 2018 Juliano Terres. All rights reserved.
//

import XCTest

class ScreenshotsTestsUI: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testMakeScreenshots() {
        let app = XCUIApplication()
        setupSnapshot(app)
        app.launch()
        snapshot("0-List")
        let table = XCUIApplication().tables
        let cells = table.cells
        cells.element(boundBy: 4).tap()
        snapshot("1-Details")
    }

}
