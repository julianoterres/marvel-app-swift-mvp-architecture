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
    private var viewModel: CharacterDetailViewModelProtocol!
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
        self.viewModel = nil
        self.tableView = nil
    }
    
    func prepareViewController(character: Marvel.Character) {
        self.viewModel = CharacterDetailViewModelMock(character: character)
        self.viewController.viewModel = self.viewModel
        self.viewController.loadView()
        self.viewController.viewDidLoad()
        self.viewController.tableView.reloadData()
        self.tableView = self.viewController.tableView
        self.window.rootViewController = viewController
        XCTAssertNotNil(self.viewController.view)
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
        XCTAssertEqual(self.viewController.title, self.viewModel.character.name)
    }
    
    func testNumberOfRows() {
        self.prepareViewController(character: CharacterMock.characterWithAllData())
        XCTAssertEqual(self.tableView.numberOfRows(inSection: EnumCharacterDetailCellSection.banner.rawValue), 1)
        XCTAssertEqual(self.tableView.numberOfRows(inSection: EnumCharacterDetailCellSection.description.rawValue), 1)
        XCTAssertEqual(self.tableView.numberOfRows(inSection: EnumCharacterDetailCellSection.title.rawValue), 1)
        XCTAssertEqual(self.tableView.numberOfRows(inSection: EnumCharacterDetailCellSection.itens.rawValue), self.viewModel.character.comics!.items!.count)
    }
    
    func testCellReuseIdentifier() {
        self.prepareViewController(character: CharacterMock.characterWithAllData())
        guard let cellBanner = self.tableView.cellForRow(at: IndexPath(row: 0, section: EnumCharacterDetailCellSection.banner.rawValue)) as? CharacterDetailCell,
              let cellDescription = self.tableView.cellForRow(at: IndexPath(row: 0, section: EnumCharacterDetailCellSection.description.rawValue)) as? CharacterDetailCell,
              let cellTitleComics = self.tableView.cellForRow(at: IndexPath(row: 0, section: EnumCharacterDetailCellSection.title.rawValue)) as? CharacterDetailCell,
              let cellComicsItem = self.tableView.cellForRow(at: IndexPath(row: 0, section: EnumCharacterDetailCellSection.itens.rawValue)) as? CharacterDetailCell else {
                  XCTAssert(false, "Failed to load of cell")
                  return
        }
        XCTAssertEqual(cellBanner.reuseIdentifier, EnumCharacterDetailCellReusubleIdentifier.image.rawValue)
        XCTAssertEqual(cellDescription.reuseIdentifier, EnumCharacterDetailCellReusubleIdentifier.text.rawValue)
        XCTAssertEqual(cellTitleComics.reuseIdentifier, EnumCharacterDetailCellReusubleIdentifier.title.rawValue)
        XCTAssertEqual(cellComicsItem.reuseIdentifier, EnumCharacterDetailCellReusubleIdentifier.text.rawValue)
    }
    
}
