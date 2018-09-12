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
    private var viewModel: CharacterListViewModelMock!
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
        self.viewModel = nil
        self.tableView = nil
        self.navigationController = nil
    }
    
    func prepareViewController(returnType: EnumReturnType) {
        self.viewModel = CharacterListViewModelMock(returnType: returnType)
        self.viewController.viewModel = self.viewModel
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
        self.prepareViewController(returnType: .success)
        XCTAssertNotNil(self.tableView)
        XCTAssertNotNil(self.tableView.delegate)
        XCTAssertNotNil(self.tableView.dataSource)
        XCTAssertTrue(self.viewController.conforms(to: UITableViewDelegate.self))
        XCTAssertTrue(self.viewController.conforms(to: UITableViewDataSource.self))
        XCTAssertTrue(self.viewController.responds(to: #selector(self.viewController.tableView(_:numberOfRowsInSection:))))
        XCTAssertTrue(self.viewController.responds(to: #selector(self.viewController.tableView(_:cellForRowAt:))))
    }
    
    func testNavigationTitle() {
        self.prepareViewController(returnType: .success)
        XCTAssertEqual(self.viewController.title, "Characters")
    }
    
    func testNumberOfRows() {
        self.prepareViewController(returnType: .success)
        XCTAssertEqual(self.tableView.numberOfRows(inSection: EnumCharacterListCellSection.character.rawValue), self.viewController.viewModel.characters.count)
    }
    
    func testHeightCell() {
        self.prepareViewController(returnType: .success)
        guard let cell = self.tableView.cellForRow(at: IndexPath(row: 0, section: EnumCharacterListCellSection.character.rawValue)) as? CharacterListCell else {
            XCTAssert(false, "Failed to load of cell")
            return
        }
        XCTAssertEqual(cell.bounds.height, CharacterListCell.height)
    }
    
    func testCellReuseIdentifier() {
        self.prepareViewController(returnType: .success)
        guard let cell = self.tableView.cellForRow(at: IndexPath(row: 0, section: EnumCharacterListCellSection.character.rawValue)) as? CharacterListCell else {
                XCTAssert(false, "Failed to load of cell")
                return
        }
        XCTAssertEqual(cell.reuseIdentifier, EnumCharacterListCellReusubleIdentifier.character.rawValue)
    }
    
    func testDidSelectRowAt() {
        self.prepareViewController(returnType: .success)
        self.viewController.tableView.delegate?.tableView!(self.viewController.tableView, didSelectRowAt: IndexPath(row: 0, section: EnumCharacterListCellSection.character.rawValue))
        self.wait(seconds: 7) { [weak self] in
            XCTAssertTrue(self?.viewController.navigationController?.topViewController is CharacterDetailViewController)
        }
    }
    
    func testScrollViewDidScroll() {
        self.prepareViewController(returnType: .success)
        self.viewController.tableView.scrollToRow(at: IndexPath.init(row: 19, section: 0), at: .bottom, animated: false)
        XCTAssertEqual(self.viewController.viewModel.characters.count, 40)
    }
    
    func testLoadSuccess() {
        self.prepareViewController(returnType: .success)
    }
    
    func testLoadError() {
        self.prepareViewController(returnType: .error)
    }
    
}
