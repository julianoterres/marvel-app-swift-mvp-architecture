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
        XCTAssertNotNil(characterListViewController.tableView)
        XCTAssertNotNil(characterListViewController.tableView.delegate)
        XCTAssertNotNil(characterListViewController.tableView.dataSource)
        XCTAssertTrue(characterListViewController.conforms(to: UITableViewDelegate.self))
        XCTAssertTrue(characterListViewController.conforms(to: UITableViewDataSource.self))
        XCTAssertTrue(characterListViewController.responds(to: #selector(characterListViewController.tableView(_:numberOfRowsInSection:))))
        XCTAssertTrue(characterListViewController.responds(to: #selector(characterListViewController.tableView(_:cellForRowAt:))))
        XCTAssertTrue(characterListViewController.responds(to: #selector(characterListViewController.tableView(_:didSelectRowAt:))))
    }
    
    func testViewController() {
        checkTable()
        
        characterListViewController.tableView.reloadData()
            
        XCTAssertEqual(characterListViewController.tableView.numberOfSections, 1)
        XCTAssertEqual(characterListViewController.tableView.numberOfRows(inSection: EnumCharacterListCellSection.character.rawValue), characters.count)

        let character = characterListViewController.characterListViewModel.get(index: 0)
        let cell = characterListViewController.tableView.cellForRow(at: IndexPath.init(row: 0, section: EnumCharacterListCellSection.character.rawValue)) as! CharacterListCell
        
        XCTAssertEqual(cell.reuseIdentifier, EnumCharacterListCellReusubleIdentifier.character.rawValue)
        XCTAssertEqual(cell.name.text, character.name)
        XCTAssertEqual(cell.avatar.kf.webURL, character.getImage(size: EnumImagesSizes.portraitMedium))
        
        characterListViewController.tableView.delegate?.tableView!(characterListViewController.tableView, didSelectRowAt: IndexPath.init(row: 0, section: EnumCharacterListCellSection.character.rawValue))

        wait(seconds: 1) { [weak self] in
            XCTAssertTrue(self?.characterListViewController.navigationController?.topViewController is CharacterDetailViewController)
        }
    }
    
    func testReloadTable() {
        checkTable()
        characterListViewController.reloadTable()
        XCTAssertEqual(characterListViewController.tableViewFooter.frame.size.height, 44)
        XCTAssertNotNil(characterListViewController.tableView.reloadData())
        XCTAssertFalse(characterListViewController.tableView.isHidden)
        XCTAssertTrue(characterListViewController.loaderMain.isHidden)
    }
    
}
