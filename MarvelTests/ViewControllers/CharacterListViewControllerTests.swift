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
    
    private var characterListNavigationController: UINavigationController!
    private var characterListViewController: CharacterListViewController!
    private var characters: [Marvel.Character]!
    private var characterMock: CharacterMock!
    private var promise: XCTestExpectation!
    
    override func setUp() {
        super.setUp()
        characterMock = CharacterMock()
        
        characterListNavigationController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CharacterListNavigationController") as? UINavigationController
        characterListNavigationController.loadView()
        characterListNavigationController.viewDidLoad()
        
        characterListViewController = characterListNavigationController.viewControllers[0] as? CharacterListViewController
        characterListViewController.loadView()
    }
    
    override func tearDown() {
        super.tearDown()
        characterListNavigationController = nil
        characterListViewController = nil
        characters = nil
        characterMock = nil
        promise = nil
    }
    
    func setCharacterWithData() {
        characters = characterMock.charactersWithData()
        characterListViewController.characterListViewModel.characters = characters
        viewDidLoad()
    }
    
    func viewDidLoad() {
        characterListViewController.viewDidLoad()
        characterListViewController.tableView.reloadData()
    }
    
    func testcheckTable() {
        XCTAssertNotNil(characterListViewController.tableView)
        XCTAssertNotNil(characterListViewController.tableView.delegate)
        XCTAssertNotNil(characterListViewController.tableView.dataSource)
        XCTAssertTrue(characterListViewController.conforms(to: UITableViewDelegate.self))
        XCTAssertTrue(characterListViewController.conforms(to: UITableViewDataSource.self))
        XCTAssertTrue(characterListViewController.responds(to: #selector(characterListViewController.tableView(_:numberOfRowsInSection:))))
        XCTAssertTrue(characterListViewController.responds(to: #selector(characterListViewController.tableView(_:cellForRowAt:))))
        XCTAssertTrue(characterListViewController.responds(to: #selector(characterListViewController.tableView(_:didSelectRowAt:))))
    }
    
    func testNumberOfSections() {
        setCharacterWithData()
        XCTAssertEqual(characterListViewController.tableView.numberOfSections, 1)
    }
    
    func testNumberOfRows() {
        setCharacterWithData()
        XCTAssertEqual(characterListViewController.tableView.numberOfRows(inSection: EnumCharacterListCellSection.character.rawValue), characters.count)
    }
    
    func testHeightForRowAt() {
        setCharacterWithData()
        guard let cell = characterListViewController.tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? CharacterListCell else {
            XCTAssert(false, "Failed to load of cell")
            return
        }
        XCTAssertEqual(cell.bounds.height, 57)
    }
    
    func testCellReuseIdentifier() {
        setCharacterWithData()
        guard let cell = characterListViewController.tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? CharacterListCell else {
            XCTAssert(false, "Failed to load of cell")
            return
        }
        XCTAssertEqual(cell.reuseIdentifier, EnumCharacterListCellReusubleIdentifier.character.rawValue)
    }
    
    func testCellErrorGetCell() {
        setCharacterWithData()
        guard (characterListViewController.tableView.cellForRow(at: IndexPath(row: 99999, section: 99999)) as? CharacterListCell) != nil else {
            XCTAssert(true)
            return
        }
    }
    
    func testDidSelectRowAt() {
        setCharacterWithData()
        characterListViewController.tableView.delegate?.tableView!(characterListViewController.tableView, didSelectRowAt: IndexPath(row: 0, section: EnumCharacterListCellSection.character.rawValue))
        wait(seconds: 7) { [weak self] in
            XCTAssertTrue(self?.characterListViewController.navigationController?.topViewController is CharacterDetailViewController)
        }
    }
    
    func testLoadSuccess() {
        XCTAssertNotNil(characterListViewController.load())
    }
    
    func testLoadError() {
        characterListViewController.characterListViewModel.limit = -99
        characterListViewController.load()
    }
    
}
