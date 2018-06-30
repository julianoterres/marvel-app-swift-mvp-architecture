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
        XCTAssertNotNil(characterDetailViewController.tableView)
        XCTAssertNotNil(characterDetailViewController.tableView.delegate)
        XCTAssertNotNil(characterDetailViewController.tableView.dataSource)
        XCTAssertTrue(characterDetailViewController.conforms(to: UITableViewDelegate.self))
        XCTAssertTrue(characterDetailViewController.conforms(to: UITableViewDataSource.self))
        XCTAssertTrue(characterDetailViewController.responds(to: #selector(characterDetailViewController.tableView(_:numberOfRowsInSection:))))
        XCTAssertTrue(characterDetailViewController.responds(to: #selector(characterDetailViewController.tableView(_:cellForRowAt:))))
    }
    
    func testViewController() {
        checkTable()
        
        XCTAssertEqual(characterDetailViewController.title, character.name)
        XCTAssertEqual(characterDetailViewController.tableView.numberOfSections, 4)
        
        XCTAssertEqual(characterDetailViewController.tableView.numberOfRows(inSection: EnumCharacterDetailCellSection.banner.rawValue), 1)
        let cellBanner = characterDetailViewController.tableView.cellForRow(at: IndexPath.init(row: 0, section: EnumCharacterDetailCellSection.banner.rawValue)) as! CharacterDetailCell
        XCTAssertEqual(cellBanner.reuseIdentifier, EnumCharacterDetailCellReusubleIdentifier.image.rawValue)
        XCTAssertEqual(cellBanner.banner.kf.webURL, character.getImage(size: EnumImagesSizes.landscapeIncredible))
        
        XCTAssertEqual(characterDetailViewController.tableView.numberOfRows(inSection: EnumCharacterDetailCellSection.description.rawValue), 1)
        let cellDescription = characterDetailViewController.tableView.cellForRow(at: IndexPath.init(row: 0, section: EnumCharacterDetailCellSection.description.rawValue)) as! CharacterDetailCell
        XCTAssertEqual(cellDescription.reuseIdentifier, EnumCharacterDetailCellReusubleIdentifier.text.rawValue)
        XCTAssertEqual(cellDescription.item.text, character.desc)
        
        XCTAssertEqual(characterDetailViewController.tableView.numberOfRows(inSection: EnumCharacterDetailCellSection.title.rawValue), 1)
        let cellTitleComics = characterDetailViewController.tableView.cellForRow(at: IndexPath.init(row: 0, section: EnumCharacterDetailCellSection.title.rawValue)) as! CharacterDetailCell
        XCTAssertEqual(cellTitleComics.reuseIdentifier, EnumCharacterDetailCellReusubleIdentifier.title.rawValue)
        XCTAssertEqual(cellTitleComics.title.text, "Comics")
        XCTAssertEqual(cellTitleComics.consTitleTop.constant, 20)
        XCTAssertEqual(cellTitleComics.consSeparatorTop.constant, 20)
        XCTAssertEqual(cellTitleComics.separator.isHidden, false)
        
        guard let itens = character.comics?.items else {
            XCTFail("Characters not have comics intens")
            return
        }
        
        XCTAssertEqual(characterDetailViewController.tableView.numberOfRows(inSection: EnumCharacterDetailCellSection.itens.rawValue), itens.count)
        let cellComicsItem = characterDetailViewController.tableView.cellForRow(at: IndexPath.init(row: 0, section: EnumCharacterDetailCellSection.itens.rawValue)) as! CharacterDetailCell
        XCTAssertEqual(cellComicsItem.reuseIdentifier, EnumCharacterDetailCellReusubleIdentifier.text.rawValue)
        XCTAssertEqual(cellComicsItem.item.text, itens[0].name)
        
        characterDetailViewController.character.desc = ""
        characterDetailViewController.tableView.reloadData()
            
        XCTAssertEqual(characterDetailViewController.tableView.numberOfRows(inSection: EnumCharacterDetailCellSection.title.rawValue), 1)
        let cellTitleComicsWithDesc = characterDetailViewController.tableView.cellForRow(at: IndexPath.init(row: 0, section: EnumCharacterDetailCellSection.title.rawValue)) as! CharacterDetailCell
        XCTAssertEqual(cellTitleComicsWithDesc.reuseIdentifier, EnumCharacterDetailCellReusubleIdentifier.title.rawValue)
        XCTAssertEqual(cellTitleComicsWithDesc.title.text, "Comics")
        XCTAssertEqual(cellTitleComicsWithDesc.consTitleTop.constant, 0)
        XCTAssertEqual(cellTitleComicsWithDesc.consSeparatorTop.constant, 0)
        XCTAssertEqual(cellTitleComicsWithDesc.separator.isHidden, true)
        
    }
    
}
