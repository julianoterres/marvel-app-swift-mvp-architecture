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
    
    private var viewController: CharacterDetailViewController!
    private var character: Marvel.Character!
    private var mock: CharacterMock!
    private var storyboard: UIStoryboard!
    
    override func setUp() {
        super.setUp()
        mock = CharacterMock()
        storyboard = UIStoryboard(name: "Main", bundle: nil)
        viewController = storyboard.instantiateViewController(withIdentifier: "CharacterDetailViewController") as? CharacterDetailViewController
        viewController.loadView()
    }
    
    override func tearDown() {
        super.tearDown()
        viewController = nil
        character = nil
        mock = nil
        storyboard = nil
    }
    
    func setCharacterWithData() {
        character = mock.characterWithAllData()
        viewController.character = character
        viewDidLoad()
    }
    
    func setCharacterWithoutData() {
        character = mock.characterWithoutData()
        viewController.character = character
        viewDidLoad()
    }
    
    func viewDidLoad() {
        viewController.viewDidLoad()
        viewController.tableView.reloadData()
    }
    
    func testNavigationTitle() {
        setCharacterWithData()
        XCTAssertEqual(viewController.title, character.name)
    }
    
    func testCheckTable() {
        XCTAssertNotNil(viewController.tableView)
        XCTAssertNotNil(viewController.tableView.delegate)
        XCTAssertNotNil(viewController.tableView.dataSource)
        XCTAssertTrue(viewController.conforms(to: UITableViewDelegate.self))
        XCTAssertTrue(viewController.conforms(to: UITableViewDataSource.self))
        XCTAssertTrue(viewController.responds(to: #selector(viewController.tableView(_:numberOfRowsInSection:))))
        XCTAssertTrue(viewController.responds(to: #selector(viewController.tableView(_:cellForRowAt:))))
    }
    
    func testNumberOfSections() {
        setCharacterWithData()
       XCTAssertEqual(viewController.tableView.numberOfSections, 4)
    }
    
    func testNumberOfRows() {
        setCharacterWithData()
        XCTAssertEqual(viewController.tableView.numberOfRows(inSection: EnumCharacterDetailCellSection.banner.rawValue), 1)
        XCTAssertEqual(viewController.tableView.numberOfRows(inSection: EnumCharacterDetailCellSection.description.rawValue), 1)
        XCTAssertEqual(viewController.tableView.numberOfRows(inSection: EnumCharacterDetailCellSection.title.rawValue), 1)
        XCTAssertEqual(viewController.tableView.numberOfRows(inSection: EnumCharacterDetailCellSection.itens.rawValue),
                       character.comics!.items!.count)
    }
    
    func testCellReuseIdentifier() {
        setCharacterWithData()
        guard let cellBanner = viewController.tableView.cellForRow(at: IndexPath(row: 0, section: EnumCharacterDetailCellSection.banner.rawValue)) as? CharacterDetailCell,
            let cellDescription = viewController.tableView.cellForRow(at: IndexPath(row: 0, section: EnumCharacterDetailCellSection.description.rawValue)) as? CharacterDetailCell,
            let cellTitleComics = viewController.tableView.cellForRow(at: IndexPath(row: 0, section: EnumCharacterDetailCellSection.title.rawValue)) as? CharacterDetailCell,
            let cellComicsItem = viewController.tableView.cellForRow(at: IndexPath(row: 0, section: EnumCharacterDetailCellSection.itens.rawValue)) as? CharacterDetailCell else {
                XCTAssert(false, "Failed to load of cell")
                return
        }
        
        XCTAssertEqual(cellBanner.reuseIdentifier, EnumCharacterDetailCellReusubleIdentifier.image.rawValue)
        XCTAssertEqual(cellDescription.reuseIdentifier, EnumCharacterDetailCellReusubleIdentifier.text.rawValue)
        XCTAssertEqual(cellTitleComics.reuseIdentifier, EnumCharacterDetailCellReusubleIdentifier.title.rawValue)
        XCTAssertEqual(cellComicsItem.reuseIdentifier, EnumCharacterDetailCellReusubleIdentifier.text.rawValue)
    }
    
    func testCellDataItensWithCharacterWithData() {
        setCharacterWithData()
        guard let cellBanner = viewController.tableView.cellForRow(at: IndexPath(row: 0, section: EnumCharacterDetailCellSection.banner.rawValue)) as? CharacterDetailCell,
            let cellDescription = viewController.tableView.cellForRow(at: IndexPath(row: 0, section: EnumCharacterDetailCellSection.description.rawValue)) as? CharacterDetailCell,
            let cellTitleComics = viewController.tableView.cellForRow(at: IndexPath(row: 0, section: EnumCharacterDetailCellSection.title.rawValue)) as? CharacterDetailCell,
            let cellComicsItem = viewController.tableView.cellForRow(at: IndexPath(row: 0, section: EnumCharacterDetailCellSection.itens.rawValue)) as? CharacterDetailCell else {
                XCTAssert(false, "Failed to load of cell")
                return
        }
        XCTAssertEqual(cellBanner.banner.kf.webURL, character.getImage(size: EnumImagesSizes.landscapeIncredible))
        XCTAssertEqual(cellDescription.item.text, character.description)
        XCTAssertEqual(cellTitleComics.title.text, "Comics")
        XCTAssertEqual(cellComicsItem.item.text, character.comics!.items![0].name)
    }
    
    func testCellDataItensWithCharacterWithoutData() {
        setCharacterWithoutData()
        guard let cellBanner = viewController.tableView.cellForRow(at: IndexPath(row: 0, section: EnumCharacterDetailCellSection.banner.rawValue)) as? CharacterDetailCell,
            let cellDescription = viewController.tableView.cellForRow(at: IndexPath(row: 0, section: EnumCharacterDetailCellSection.description.rawValue)) as? CharacterDetailCell,
            let cellTitleComics = viewController.tableView.cellForRow(at: IndexPath(row: 0, section: EnumCharacterDetailCellSection.title.rawValue)) as? CharacterDetailCell else {
                XCTAssert(false, "Failed to load of cell")
                return
        }
        XCTAssertEqual(cellBanner.banner.kf.webURL, character.getImage(size: EnumImagesSizes.landscapeIncredible))
        XCTAssertEqual(cellDescription.item.text, character.description)
        XCTAssertEqual(cellTitleComics.title.text, "Comics")
    }
    
}
