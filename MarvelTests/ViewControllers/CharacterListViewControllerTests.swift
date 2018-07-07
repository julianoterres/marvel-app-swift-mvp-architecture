//
//  MarvelTests.swift
//  MarvelTests
//
//  Created by Juliano Terres on 25/06/18.
//  Copyright © 2018 Juliano Terres. All rights reserved.
//

import XCTest
@testable import Kingfisher
@testable import Marvel

class CharacterListViewControllerTests: XCTestCaseBase {
    
    private var navigation: UINavigationController!
    private var controller: CharacterListViewController!
    private var characters: [Marvel.Character]!
    private var mock: CharacterMock!
    private var promise: XCTestExpectation!
    private var storyboard: UIStoryboard!
    
    override func setUp() {
        super.setUp()
        mock = CharacterMock()
        storyboard = UIStoryboard(name: "Main", bundle: nil)
        navigation = storyboard.instantiateViewController(withIdentifier: "CharacterListNavigationController") as? UINavigationController
        navigation.loadView()
        navigation.viewDidLoad()
        controller = navigation.viewControllers[0] as? CharacterListViewController
        controller.loadView()
    }
    
    override func tearDown() {
        super.tearDown()
        navigation = nil
        controller = nil
        characters = nil
        mock = nil
        promise = nil
        storyboard = nil
    }
    
    func setCharacterWithData() {
        characters = mock.charactersWithData()
        controller.viewModel.characters = characters
        viewDidLoad()
    }
    
    func viewDidLoad() {
        controller.viewDidLoad()
        controller.tableView.reloadData()
    }
    
    func testcheckTable() {
        XCTAssertNotNil(controller.tableView)
        XCTAssertNotNil(controller.tableView.delegate)
        XCTAssertNotNil(controller.tableView.dataSource)
        XCTAssertTrue(controller.conforms(to: UITableViewDelegate.self))
        XCTAssertTrue(controller.conforms(to: UITableViewDataSource.self))
        XCTAssertTrue(controller.responds(to: #selector(controller.tableView(_:numberOfRowsInSection:))))
        XCTAssertTrue(controller.responds(to: #selector(controller.tableView(_:cellForRowAt:))))
        XCTAssertTrue(controller.responds(to: #selector(controller.tableView(_:didSelectRowAt:))))
    }
    
    func testNumberOfSections() {
        setCharacterWithData()
        XCTAssertEqual(controller.tableView.numberOfSections, 1)
    }
    
    func testNumberOfRows() {
        setCharacterWithData()
        XCTAssertEqual(controller.tableView.numberOfRows(inSection: EnumCharacterListCellSection.character.rawValue), characters.count)
    }
    
    func testHeightForRowAt() {
        setCharacterWithData()
        guard let cell = controller.tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? CharacterListCell else {
            XCTAssert(false, "Failed to load of cell")
            return
        }
        XCTAssertEqual(cell.bounds.height, 57)
    }
    
    func testCellReuseIdentifier() {
        setCharacterWithData()
        guard let cell = controller.tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? CharacterListCell else {
            XCTAssert(false, "Failed to load of cell")
            return
        }
        XCTAssertEqual(cell.reuseIdentifier, EnumCharacterListCellReusubleIdentifier.character.rawValue)
    }
    
    func testCellErrorGetCell() {
        setCharacterWithData()
        guard (controller.tableView.cellForRow(at: IndexPath(row: 99999, section: 99999)) as? CharacterListCell) != nil else {
            XCTAssert(true)
            return
        }
    }
    
    func testDidSelectRowAt() {
        setCharacterWithData()
        let section = EnumCharacterListCellSection.character.rawValue
        controller.tableView.delegate?.tableView!(controller.tableView, didSelectRowAt: IndexPath(row: 0, section: section))
        wait(seconds: 7) { [weak self] in
            XCTAssertTrue(self?.controller.navigationController?.topViewController is CharacterDetailViewController)
        }
    }
    
    func testLoadSuccess() {
        XCTAssertNotNil(controller.load())
    }
    
    func testLoadError() {
        controller.viewModel.limit = -99
        controller.load()
    }
    
}
