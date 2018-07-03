//
//  UIViewControllerExtensionTests.swift
//  MarvelTests
//
//  Created by Juliano Terres on 30/06/18.
//  Copyright © 2018 Juliano Terres. All rights reserved.
//

import XCTest
@testable import Marvel

class UIViewControllerExtensionTests: XCTestCaseBase {
    
    private var viewController: UIViewController!
    
    override func setUp() {
        super.setUp()
        viewController = UIViewController()
        viewController.loadView()
        viewController.viewDidLoad()
    }
    
    override func tearDown() {
        super.tearDown()
        viewController = nil
    }
    
    func testAlert() {
        XCTAssertNotNil(viewController.showAlert(title: "Title", message: "Message", buttonText: "Ok"))
    }
    
}
