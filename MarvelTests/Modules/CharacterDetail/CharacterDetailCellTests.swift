//
//  CharacterDetailCell.swift
//  MarvelTests
//
//  Created by Juliano Terres on 08/08/18.
//  Copyright © 2018 Juliano Terres. All rights reserved.
//

import XCTest
@testable import Kingfisher
@testable import Marvel

class CharacterDetailCellTests: XCTestCaseBase {
    
//    private var window: UIWindow!
//    private var viewController: CharacterDetailViewController!
//    private var viewModel: CharacterDetailPresenterProtocol!
//    private var tableView: UITableView!
//    private let storyboard = UIStoryboard(name: "Main", bundle: nil)
//    
//    override func setUp() {
//        super.setUp()
//        self.window = UIWindow(frame: UIScreen.main.bounds)
//        self.window.isHidden = false
//        self.viewController = self.storyboard.instantiateViewController(withIdentifier: "CharacterDetailViewController") as? CharacterDetailViewController
//    }
//    
//    override func tearDown() {
//        super.tearDown()
//        self.window = nil
//        self.viewController = nil
//        self.viewModel = nil
//        self.tableView = nil
//    }
//    
//    func prepareViewController(character: Marvel.Character) {
//        self.viewModel = CharacterDetailViewModelMock(character: character)
//        self.viewController.viewModel = self.viewModel
//        self.viewController.loadView()
//        self.viewController.viewDidLoad()
//        self.viewController.tableView.reloadData()
//        self.tableView = self.viewController.tableView
//        self.window.rootViewController = viewController
//        XCTAssertNotNil(self.viewController.view)
//    }
//    
//    func testSetupBanner() {
//        self.prepareViewController(character: CharacterMock.characterWithAllData())
//        let cell = self.tableView.cellForRow(at: IndexPath.init(row: 0, section: 0)) as? CharacterDetailComicCell
//        XCTAssertEqual(cell?.banner.kf.webURL, self.viewModel.character.getImage(size: ImagesSizes.landscapeIncredible))
//    }
//    
//    func testSetupDescription() {
//        self.prepareViewController(character: CharacterMock.characterWithAllData())
//        let cell = self.tableView.cellForRow(at: IndexPath.init(row: 0, section: 1)) as? CharacterDetailComicCell
//        XCTAssertEqual(cell?.item.text, self.viewModel.character.description)
//    }
//    
//    func testSetupWithoutDescription() {
//        self.prepareViewController(character: CharacterMock.characterWithoutData())
//        let cell = self.tableView.cellForRow(at: IndexPath.init(row: 0, section: 1)) as? CharacterDetailComicCell
//        XCTAssertEqual(cell?.item.text, self.viewModel.character.description)
//    }
//    
//    func testSetupTitle() {
//        self.prepareViewController(character: CharacterMock.characterWithAllData())
//        let cell = self.tableView.cellForRow(at: IndexPath.init(row: 0, section: 2)) as? CharacterDetailComicCell
//        XCTAssertEqual(cell?.title.text, "Comics")
//    }
//    
//    func testSetupTitleWithoutText() {
//        self.prepareViewController(character: CharacterMock.characterWithoutData())
//        let cell = self.tableView.cellForRow(at: IndexPath.init(row: 0, section: 2)) as? CharacterDetailComicCell
//        XCTAssertEqual(cell?.consTitleTop.constant, 0)
//        XCTAssertEqual(cell?.consSeparatorTop.constant, 0)
//        XCTAssertEqual(cell?.separator.isHidden, true)
//    }
//    
//    func testSetupComics() {
//        self.prepareViewController(character: CharacterMock.characterWithAllData())
//        let cell = self.tableView.cellForRow(at: IndexPath.init(row: 0, section: 3)) as? CharacterDetailComicCell
//        XCTAssertEqual(cell?.item.text, self.viewModel.character.comics!.items![0].name)
//    }

}
