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
    
    override func setUp() {
        super.setUp()
        
        guard let characterMock = getCharacter() else {
            XCTFail("Failed get character")
            return
        }
        
        characterDetailViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CharacterDetailViewController") as! CharacterDetailViewController
        character = characterMock
        characterDetailViewController.character = character
        characterDetailViewController.loadView()
        characterDetailViewController.viewDidLoad()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func checkTable() {
        XCTAssertNotNil(characterDetailViewController.tableView, "Tableview not exist")
        XCTAssertNotNil(characterDetailViewController.tableView.delegate, "Tableview not have a connection with delegate")
        XCTAssertNotNil(characterDetailViewController.tableView.dataSource, "Tableview not have a connection with dataSource")
        XCTAssertTrue(characterDetailViewController.conforms(to: UITableViewDelegate.self), "Tableview complies with the protocol")
        XCTAssertTrue(characterDetailViewController.conforms(to: UITableViewDataSource.self))
        XCTAssertTrue(characterDetailViewController.responds(to: #selector(characterDetailViewController.tableView(_:numberOfRowsInSection:))), "Tableview does not have the method numberOfRowsInSection")
        XCTAssertTrue(characterDetailViewController.responds(to: #selector(characterDetailViewController.tableView(_:cellForRowAt:))), "Tableview does not have the method cellForRowAt")
    }
    
    func testViewController() {
        checkTable()
        
        XCTAssertEqual(characterDetailViewController.title, character.name, "Title of scrren not equals to character name")
        XCTAssertEqual(characterDetailViewController.tableView.numberOfSections, 4, "Number of sections not is equals to that should be")
        
        XCTAssertEqual(characterDetailViewController.tableView.numberOfRows(inSection: EnumCharacterDetailCellSection.banner.rawValue), 1, "Numbers of rows of banner rows not is equals to that should be")
        let cellBanner = characterDetailViewController.tableView.cellForRow(at: IndexPath.init(row: 0, section: EnumCharacterDetailCellSection.banner.rawValue)) as! CharacterDetailCell
        XCTAssertEqual(cellBanner.reuseIdentifier, EnumCharacterDetailCellReusubleIdentifier.image.rawValue, "Cell banner reuseble identifier not is equals to that should be")
        XCTAssertEqual(cellBanner.banner.kf.webURL, character.getImage(size: EnumImagesSizes.landscapeIncredible), "Character banner URL not is equals to that should be")
        
        XCTAssertEqual(characterDetailViewController.tableView.numberOfRows(inSection: EnumCharacterDetailCellSection.description.rawValue), 1, "Numbers of rows of description rows not is equals to that should be")
        let cellDescription = characterDetailViewController.tableView.cellForRow(at: IndexPath.init(row: 0, section: EnumCharacterDetailCellSection.description.rawValue)) as! CharacterDetailCell
        XCTAssertEqual(cellDescription.reuseIdentifier, EnumCharacterDetailCellReusubleIdentifier.text.rawValue, "Cell description reuseble identifier not is equals to that should be")
        XCTAssertEqual(cellDescription.item.text, character.desc, "Character description not is equals to that should be")
        
        XCTAssertEqual(characterDetailViewController.tableView.numberOfRows(inSection: EnumCharacterDetailCellSection.title.rawValue), 1, "Numbers of rows of title rows not is equals to that should be")
        let cellTitleComics = characterDetailViewController.tableView.cellForRow(at: IndexPath.init(row: 0, section: EnumCharacterDetailCellSection.title.rawValue)) as! CharacterDetailCell
        XCTAssertEqual(cellTitleComics.reuseIdentifier, EnumCharacterDetailCellReusubleIdentifier.title.rawValue, "Cell title reuseble identifier not is equals to that should be")
        XCTAssertEqual(cellTitleComics.title.text, "Comics", "Comics title not is equals to that should be")
        
        guard let itens = character.comics?.items else {
            XCTFail("Characters not have comics intens")
            return
        }
        
        XCTAssertEqual(characterDetailViewController.tableView.numberOfRows(inSection: EnumCharacterDetailCellSection.itens.rawValue), itens.count, "Numbers of rows of comics itens rows not is equals to that should be")
        let cellComicsItem = characterDetailViewController.tableView.cellForRow(at: IndexPath.init(row: 0, section: EnumCharacterDetailCellSection.itens.rawValue)) as! CharacterDetailCell
        XCTAssertEqual(cellComicsItem.reuseIdentifier, EnumCharacterDetailCellReusubleIdentifier.text.rawValue, "Cell comics item reuseble identifier not is equals to that should be")
        XCTAssertEqual(cellComicsItem.item.text, itens[0].name, "Comics item name not is equals to that should be")
    }
    
}
