//
//  MarvelTests.swift
//  MarvelTests
//
//  Created by Juliano Terres on 25/06/18.
//  Copyright © 2018 Juliano Terres. All rights reserved.
//

import XCTest
@testable import ObjectMapper
@testable import Kingfisher
@testable import Marvel

class CharacterListViewControllerTests: XCTestCaseBase {
    
    private var characterListNavigationController: UINavigationController!
    private var characterListViewController: CharacterListViewController!
    private var characters: [Marvel.Character]!
    
    override func setUp() {
        super.setUp()
        
        guard let charactersMock = getCharacters() else {
            XCTFail("Failed get characters")
            return
        }
        
        characters = charactersMock
        
        characterListNavigationController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CharacterListNavigationController") as! UINavigationController
        characterListNavigationController.loadView()
        characterListNavigationController.viewDidLoad()
        
        characterListViewController = characterListNavigationController.viewControllers[0] as! CharacterListViewController
        characterListViewController.loadView()
        characterListViewController.characterListViewModel.characters = characters
        characterListViewController.viewDidLoad()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func checkTable() {
        XCTAssertNotNil(characterListViewController.tableView, "Tableview not exist")
        XCTAssertNotNil(characterListViewController.tableView.delegate, "Tableview not have a connection with delegate")
        XCTAssertNotNil(characterListViewController.tableView.dataSource, "Tableview not have a connection with dataSource")
        XCTAssertTrue(characterListViewController.conforms(to: UITableViewDelegate.self), "Tableview complies with the protocol")
        XCTAssertTrue(characterListViewController.conforms(to: UITableViewDataSource.self))
        XCTAssertTrue(characterListViewController.responds(to: #selector(characterListViewController.tableView(_:numberOfRowsInSection:))), "Tableview does not have the method numberOfRowsInSection")
        XCTAssertTrue(characterListViewController.responds(to: #selector(characterListViewController.tableView(_:cellForRowAt:))), "Tableview does not have the method cellForRowAt")
        XCTAssertTrue(characterListViewController.responds(to: #selector(characterListViewController.tableView(_:didSelectRowAt:))), "Tableview does not have the method didSelectRowAt")
    }
    
    func testViewController() {
        checkTable()
        
        characterListViewController.tableView.reloadData()
            
        XCTAssertEqual(characterListViewController.tableView.numberOfSections, 1, "Number of sections not is equals to that should be")
        XCTAssertEqual(characterListViewController.tableView.numberOfRows(inSection: EnumCharacterListCellSection.character.rawValue), characters.count, "Number of rows of section table not equal to character array")

        let character = characterListViewController.characterListViewModel.get(index: 0)
        let cell = characterListViewController.tableView.cellForRow(at: IndexPath.init(row: 0, section: EnumCharacterListCellSection.character.rawValue)) as! CharacterListCell
        
        XCTAssertEqual(cell.reuseIdentifier, EnumCharacterListCellReusubleIdentifier.character.rawValue, "Cell character reuseble identifier not is equals to that should be")
        XCTAssertEqual(cell.name.text, character.name, "Character name not is equals to that should be")
        XCTAssertEqual(cell.avatar.kf.webURL, character.getImage(size: EnumImagesSizes.portraitMedium), "Character avatar URL not is equals to that should be")
        
        characterListViewController.tableView.delegate?.tableView!(characterListViewController.tableView, didSelectRowAt: IndexPath.init(row: 0, section: EnumCharacterListCellSection.character.rawValue))

        wait(seconds: 1) { [weak self] in
            XCTAssertTrue(self?.characterListViewController.navigationController?.topViewController is CharacterDetailViewController,
                          "When tap in a cell, the user not is send to CharacterDetailViewController screen")

        }
    }
    
}
