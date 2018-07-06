//
//  CharacterDetailViewControllerTests.swift
//  MarvelTests
//
//  Created by Juliano Terres on 29/06/18.
//  Copyright © 2018 Juliano Terres. All rights reserved.
//

import XCTest
@testable import ObjectMapper
@testable import Kingfisher
@testable import Marvel

class CharacterDetailViewControllerTests: XCTestCaseBase {
    
    private var characterDetailViewController: CharacterDetailViewController!
    private var character: Marvel.Character!
    private var characterMock: CharacterMock!
    
    override func setUp() {
        super.setUp()
        characterMock = CharacterMock()
        characterDetailViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CharacterDetailViewController") as? CharacterDetailViewController
        characterDetailViewController.loadView()
    }
    
    override func tearDown() {
        super.tearDown()
        characterDetailViewController = nil
        character = nil
        characterMock = nil
    }
    
    func setCharacterWithData() {
        character = characterMock.characterWithAllData()
        characterDetailViewController.character = character
        viewDidLoad()
    }
    
    func setCharacterWithoutData() {
        character = characterMock.characterWithoutData()
        characterDetailViewController.character = character
        viewDidLoad()
    }
    
    func viewDidLoad() {
        characterDetailViewController.viewDidLoad()
        characterDetailViewController.tableView.reloadData()
    }
    
    func testNavigationTitle() {
        setCharacterWithData()
        XCTAssertEqual(characterDetailViewController.title, character.name)
    }
    
    func testCheckTable() {
        XCTAssertNotNil(characterDetailViewController.tableView)
        XCTAssertNotNil(characterDetailViewController.tableView.delegate)
        XCTAssertNotNil(characterDetailViewController.tableView.dataSource)
        XCTAssertTrue(characterDetailViewController.conforms(to: UITableViewDelegate.self))
        XCTAssertTrue(characterDetailViewController.conforms(to: UITableViewDataSource.self))
        XCTAssertTrue(characterDetailViewController.responds(to: #selector(characterDetailViewController.tableView(_:numberOfRowsInSection:))))
        XCTAssertTrue(characterDetailViewController.responds(to: #selector(characterDetailViewController.tableView(_:cellForRowAt:))))
    }
    
    func testNumberOfSections() {
        setCharacterWithData()
       XCTAssertEqual(characterDetailViewController.tableView.numberOfSections, 4)
    }
    
    func testNumberOfRows() {
        setCharacterWithData()
        XCTAssertEqual(characterDetailViewController.tableView.numberOfRows(inSection: EnumCharacterDetailCellSection.banner.rawValue), 1)
        XCTAssertEqual(characterDetailViewController.tableView.numberOfRows(inSection: EnumCharacterDetailCellSection.description.rawValue), 1)
        XCTAssertEqual(characterDetailViewController.tableView.numberOfRows(inSection: EnumCharacterDetailCellSection.title.rawValue), 1)
        XCTAssertEqual(characterDetailViewController.tableView.numberOfRows(inSection: EnumCharacterDetailCellSection.itens.rawValue), character.comics!.items!.count)
    }
    
    func testCellReuseIdentifier() {
        setCharacterWithData()
        guard let cellBanner = characterDetailViewController.tableView.cellForRow(at: IndexPath(row: 0, section: EnumCharacterDetailCellSection.banner.rawValue)) as? CharacterDetailCell,
            let cellDescription = characterDetailViewController.tableView.cellForRow(at: IndexPath(row: 0, section: EnumCharacterDetailCellSection.description.rawValue)) as? CharacterDetailCell,
            let cellTitleComics = characterDetailViewController.tableView.cellForRow(at: IndexPath(row: 0, section: EnumCharacterDetailCellSection.title.rawValue)) as? CharacterDetailCell,
            let cellComicsItem = characterDetailViewController.tableView.cellForRow(at: IndexPath(row: 0, section: EnumCharacterDetailCellSection.itens.rawValue)) as? CharacterDetailCell else {
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
        guard let cellBanner = characterDetailViewController.tableView.cellForRow(at: IndexPath(row: 0, section: EnumCharacterDetailCellSection.banner.rawValue)) as? CharacterDetailCell,
            let cellDescription = characterDetailViewController.tableView.cellForRow(at: IndexPath(row: 0, section: EnumCharacterDetailCellSection.description.rawValue)) as? CharacterDetailCell,
            let cellTitleComics = characterDetailViewController.tableView.cellForRow(at: IndexPath(row: 0, section: EnumCharacterDetailCellSection.title.rawValue)) as? CharacterDetailCell,
            let cellComicsItem = characterDetailViewController.tableView.cellForRow(at: IndexPath(row: 0, section: EnumCharacterDetailCellSection.itens.rawValue)) as? CharacterDetailCell else {
                XCTAssert(false, "Failed to load of cell")
                return
        }
        XCTAssertEqual(cellBanner.banner.kf.webURL, character.getImage(size: EnumImagesSizes.landscapeIncredible))
        XCTAssertEqual(cellDescription.item.text, character.desc)
        XCTAssertEqual(cellTitleComics.title.text, "Comics")
        XCTAssertEqual(cellComicsItem.item.text, character.comics!.items![0].name)
    }
    
    func testCellDataItensWithCharacterWithoutData() {
        setCharacterWithoutData()
        guard let cellBanner = characterDetailViewController.tableView.cellForRow(at: IndexPath(row: 0, section: EnumCharacterDetailCellSection.banner.rawValue)) as? CharacterDetailCell,
            let cellDescription = characterDetailViewController.tableView.cellForRow(at: IndexPath(row: 0, section: EnumCharacterDetailCellSection.description.rawValue)) as? CharacterDetailCell,
            let cellTitleComics = characterDetailViewController.tableView.cellForRow(at: IndexPath(row: 0, section: EnumCharacterDetailCellSection.title.rawValue)) as? CharacterDetailCell else {
                XCTAssert(false, "Failed to load of cell")
                return
        }
        XCTAssertEqual(cellBanner.banner.kf.webURL, character.getImage(size: EnumImagesSizes.landscapeIncredible))
        XCTAssertEqual(cellDescription.item.text, character.desc)
        XCTAssertEqual(cellTitleComics.title.text, "Comics")
    }
    
}
