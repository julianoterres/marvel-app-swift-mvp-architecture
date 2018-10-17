//
//  BaseViewControllerTests.swift
//  MarvelTests
//
//  Created by Juliano Terres on 17/10/18.
//  Copyright © 2018 Juliano Terres. All rights reserved.
//

import XCTest
@testable import Marvel

class BaseViewControllerTests: XCTestCaseBase {
    
    var navigationController: UINavigationController!
    var viewController: BaseViewController!
    
    override func setUp() {
        super.setUp()
        self.navigationController = UINavigationController()
        self.viewController = BaseViewController()
        self.navigationController.viewControllers = [self.viewController]
        self.navigationController.loadView()
        self.navigationController.viewDidLoad()
    }

    override func tearDown() {
        super.tearDown()
        self.navigationController = nil
        self.viewController = nil
    }

    func testViewDidLoad() {
        self.viewController.viewDidLoad()
        XCTAssertEqual(self.viewController.navigationController?.navigationBar.backIndicatorImage, UIImage(named: "arrowLeftWhite"))
    }

}
