//
//  CharacterListViewControllerTests.swift
//  MarvelTests
//
//  Created by Juliano Terres on 10/09/18.
//  Copyright © 2018 Juliano Terres. All rights reserved.
//

import XCTest
@testable import Kingfisher
@testable import Marvel

class CharacterListViewControllerTests: XCTestCaseBase {
    
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
    
    func prepareViewController() {
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
    
    func testTableView() {
        self.prepareViewController()
        XCTAssertNotNil(self.tableView)
        XCTAssertNotNil(self.tableView.delegate)
        XCTAssertNotNil(self.tableView.dataSource)
        XCTAssertTrue(self.viewController.conforms(to: UITableViewDelegate.self))
        XCTAssertTrue(self.viewController.conforms(to: UITableViewDataSource.self))
        XCTAssertTrue(self.viewController.responds(to: #selector(self.viewController.tableView(_:numberOfRowsInSection:))))
        XCTAssertTrue(self.viewController.responds(to: #selector(self.viewController.tableView(_:cellForRowAt:))))
    }
    
    func testNavigationTitle() {
        self.prepareViewController()
        XCTAssertEqual(self.viewController.title, "Characters")
    }
    
    func testNumberOfRows() {
        self.prepareViewController()
        XCTAssertEqual(self.tableView.numberOfRows(inSection: CharacterListCellSection.character.rawValue), self.viewController.characters.count)
    }
    
    func testHeightCell() {
        self.prepareViewController()
        guard let cell = self.tableView.cellForRow(at: IndexPath(row: 0, section: CharacterListCellSection.character.rawValue)) as? CharacterListCell else {
            XCTAssert(false, "Failed to load of cell")
            return
        }
        XCTAssertEqual(cell.bounds.height, CharacterListCell.height)
    }
    
    func testCellReuseIdentifier() {
        self.prepareViewController()
        guard let cell = self.tableView.cellForRow(at: IndexPath(row: 0, section: CharacterListCellSection.character.rawValue)) as? CharacterListCell else {
            XCTAssert(false, "Failed to load of cell")
            return
        }
        XCTAssertEqual(cell.reuseIdentifier, CharacterListCellReusubleIdentifier.character.rawValue)
    }
    
    func testDidSelectRowAt() {
        self.prepareViewController()
        self.viewController.tableView.delegate?.tableView!(self.viewController.tableView, didSelectRowAt: IndexPath(row: 0, section: CharacterListCellSection.character.rawValue))
        self.wait(seconds: 7) { [weak self] in
            XCTAssertTrue(self?.viewController.navigationController?.topViewController is CharacterDetailViewController)
        }
    }
    
    func testShowError() {
        self.prepareViewController()
        self.viewController.showError(message: "Error Message")
        XCTAssertEqual(self.viewController.loaderMain.isHidden, true)
    }
    
    func testScrollViewDidScroll() {
        self.prepareViewController()
        self.viewController.tableView.scrollToRow(at: IndexPath.init(row: 19, section: 0), at: .bottom, animated: false)
        XCTAssertEqual(self.viewController.characters.count, 40)
    }
    
}
