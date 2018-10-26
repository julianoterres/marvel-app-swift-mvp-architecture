//
//  CharacterDetailViewControllerTests.swift
//  MarvelTests
//
//  Created by Juliano Terres on 29/06/18.
//  Copyright © 2018 Juliano Terres. All rights reserved.
//

import XCTest
@testable import Kingfisher
@testable import Marvel

class CharacterDetailViewControllerTests: XCTestCaseBase {
    
    private var window: UIWindow!
    private var viewController: CharacterDetailViewController!
    private var presenter: CharacterDetailPresenterProtocol!
    private var tableView: UITableView!
    private let storyboard = UIStoryboard(name: "Main", bundle: nil)
    
    override func setUp() {
        super.setUp()
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window.isHidden = false
        self.viewController = self.storyboard.instantiateViewController(withIdentifier: "CharacterDetailViewController") as? CharacterDetailViewController
    }
    
    override func tearDown() {
        super.tearDown()
        self.window = nil
        self.viewController = nil
        self.presenter = nil
        self.tableView = nil
    }
    
    func prepareViewController(character: Marvel.Character) {
        self.presenter = CharacterDetailPresenterMock(view: self.viewController, service: CharacterServiceMock(), character: character)
        self.viewController.presenter = self.presenter
        self.viewController.character = character
        self.viewController.loadView()
        self.viewController.viewDidLoad()
        self.viewController.tableView.reloadData()
        self.tableView = self.viewController.tableView
        self.window.rootViewController = viewController
        XCTAssertNotNil(self.viewController.view)
    }
    
    func testSetupBanner() {
        self.prepareViewController(character: CharacterMock.characterWithAllData())
        XCTAssertEqual(self.viewController.banner.kf.webURL, self.viewController.character.getImage(size: ImagesSizes.landscapeIncredible))
    }
    
    func testSetupDescription() {
        self.prepareViewController(character: CharacterMock.characterWithAllData())
        XCTAssertEqual(self.viewController.text.text, self.viewController.character.description)
    }
    
    func testSetupWithoutDescription() {
        self.prepareViewController(character: CharacterMock.characterWithoutData())
        XCTAssertEqual(self.viewController.text.text, self.viewController.character.description)
    }
    
    func testTableView() {
        self.prepareViewController(character: CharacterMock.characterWithAllData())
        XCTAssertNotNil(self.tableView)
        XCTAssertNotNil(self.tableView.delegate)
        XCTAssertNotNil(self.tableView.dataSource)
        XCTAssertTrue(self.viewController.conforms(to: UITableViewDelegate.self))
        XCTAssertTrue(self.viewController.conforms(to: UITableViewDataSource.self))
        XCTAssertTrue(self.viewController.responds(to: #selector(self.viewController.tableView(_:numberOfRowsInSection:))))
        XCTAssertTrue(self.viewController.responds(to: #selector(self.viewController.tableView(_:cellForRowAt:))))
    }
    
    func testNavigationTitle() {
        self.prepareViewController(character: CharacterMock.characterWithAllData())
        XCTAssertEqual(self.viewController.title, self.viewController.character.name)
    }
    
    func testNumberOfRows() {
        self.prepareViewController(character: CharacterMock.characterWithAllData())
        XCTAssertEqual(self.tableView.numberOfRows(inSection: CharacterListCellSection.character.rawValue), self.viewController.character.listComics?.count)
    }
    
    func testHeightCell() {
        self.prepareViewController(character: CharacterMock.characterWithAllData())
        guard let cell = self.tableView.cellForRow(at: IndexPath(row: 0, section: CharacterDetailComicCellSection.comic.rawValue)) as? CharacterDetailComicCell else {
            XCTAssert(false, "Failed to load of cell")
            return
        }
        XCTAssertEqual(cell.bounds.height, CharacterDetailComicCell.height)
    }
    
    func testCellReuseIdentifier() {
        self.prepareViewController(character: CharacterMock.characterWithAllData())
        guard let cell = self.tableView.cellForRow(at: IndexPath(row: 0, section: CharacterDetailComicCellSection.comic.rawValue)) as? CharacterDetailComicCell else {
            XCTAssert(false, "Failed to load of cell")
            return
        }
        XCTAssertEqual(cell.reuseIdentifier, CharacterDetailCellReusubleIdentifier.comic.rawValue)
    }
    
    func testShowError() {
        self.prepareViewController(character: CharacterMock.characterWithoutData())
        self.viewController.showError(message: "Error Message")
        XCTAssertEqual(self.viewController.loader.isHidden, true)
        XCTAssertEqual(self.viewController.notFoundData.text, "Error Message")
        XCTAssertEqual(self.viewController.notFoundData.isHidden, false)
        XCTAssertEqual(self.viewController.scrollView.isHidden, true)
    }
    
}
