//
//  UINavigationControllerExtensionTests.swift
//  MarvelTests
//
//  Created by Juliano Terres on 12/09/18.
//  Copyright © 2018 Juliano Terres. All rights reserved.
//

import XCTest
@testable import Marvel

class UINavigationControllerExtensionTests: XCTestCaseBase {
    
    private var window: UIWindow!
    private var navigationController: UINavigationController!
    private let storyboard = UIStoryboard(name: "Main", bundle: nil)
    
    override func setUp() {
        super.setUp()
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window.isHidden = false
        self.navigationController = self.storyboard.instantiateViewController(withIdentifier: "CharacterListNavigationController") as? UINavigationController
    }
    
    override func tearDown() {
        super.tearDown()
        self.window = nil
        self.navigationController = nil
    }
    
    func prepareViewController() {
        self.navigationController.loadView()
        self.navigationController.viewDidLoad()
        self.navigationController?.changeBackButtonImage()
        self.window.rootViewController = self.navigationController
        XCTAssertNotNil(self.navigationController.view)
    }
    
    func testGoToCharacterDetailScreen() {
        self.navigationController.goToCharacterDetailScreen(character: CharacterMock.characterWithAllData())
        XCTAssertTrue(self.navigationController.topViewController is CharacterDetailViewController)
    }
    
    func testBackButtonImage() {
        self.prepareViewController()
        XCTAssertEqual(self.navigationController.navigationBar.backIndicatorImage, UIImage(named: "arrowLeftWhite"))
    }
    
}
