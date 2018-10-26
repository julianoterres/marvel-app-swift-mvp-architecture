//
//  CharacterListCellTests.swift
//  MarvelTests
//
//  Created by Juliano Terres on 12/09/18.
//  Copyright © 2018 Juliano Terres. All rights reserved.
//

import XCTest
@testable import Kingfisher
@testable import Marvel

class CharacterListCellTests: XCTestCaseBase {

    private var window: UIWindow!
    private var viewController: CharacterListViewController!
    private var presenter: CharacterListPresenterProtocol!
    private var navigationController: UINavigationController!
    private var tableView: UITableView!
    private let storyboard = UIStoryboard(name: "Main", bundle: nil)
    
    override func setUp() {
        super.setUp()
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window.isHidden = false
        self.navigationController = self.storyboard.instantiateViewController(withIdentifier: "CharacterListNavigationController") as? UINavigationController
        self.viewController = self.storyboard.instantiateViewController(withIdentifier: "CharacterListViewController") as? CharacterListViewController
    }

    override func tearDown() {
        super.tearDown()
        self.window = nil
        self.viewController = nil
        self.presenter = nil
        self.tableView = nil
        self.navigationController = nil
    }

    func prepareViewController(returnType: EnumReturnType) {
        self.presenter = CharacterListPresenterMock(view: self.viewController, service: CharacterServiceMock())
        self.viewController.presenter = self.presenter
        self.viewController.loadView()
        self.viewController.viewDidLoad()
        self.viewController.tableView.reloadData()
        self.tableView = self.viewController.tableView
        self.navigationController.viewControllers = [viewController]
        self.navigationController.loadView()
        self.navigationController.viewDidLoad()
        self.window.rootViewController = self.navigationController
        XCTAssertNotNil(self.viewController.view)
    }

    func testSetup() {
        self.prepareViewController(returnType: .success)
        let character = self.viewController.characters[0]
        let cell = self.tableView.cellForRow(at: IndexPath.init(row: 0, section: 0)) as? CharacterListCell
        cell?.setup(character: character)
        XCTAssertEqual(cell?.name.text, character.name)
        XCTAssertEqual(cell?.avatar.kf.webURL, character.getImage(size: .portraitMedium))
    }
    
}
