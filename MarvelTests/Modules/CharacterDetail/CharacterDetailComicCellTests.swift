//
//  CharacterDetailComicCellTests.swift
//  MarvelTests
//
//  Created by Juliano Terres on 08/08/18.
//  Copyright © 2018 Juliano Terres. All rights reserved.
//

import XCTest
@testable import Kingfisher
@testable import Marvel

class CharacterDetailComicCellTests: XCTestCaseBase {
    
    private var window: UIWindow!
    private var viewController: CharacterDetailViewController!
    private var presenter: CharacterDetailPresenterProtocol!
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
        self.presenter = nil
        self.tableView = nil
    }

    func prepareViewController(character: Marvel.Character) {
        self.presenter = CharacterDetailPresenterMock(view: self.viewController, service: CharacterServiceMock(), character: character)
        self.viewController.presenter = self.presenter
        self.viewController.character = character
        self.viewController.loadView()
        self.viewController.viewDidLoad()
        self.viewController.tableView.reloadData()
        self.tableView = self.viewController.tableView
        self.window.rootViewController = viewController
        XCTAssertNotNil(self.viewController.view)
    }
    
    func testComicCell() {
        self.prepareViewController(character: CharacterMock.characterWithAllData())
        let comic = self.viewController.character.listComics?[0]
        let cell = self.tableView.cellForRow(at: IndexPath.init(row: 0, section: 0)) as? CharacterDetailComicCell
        cell?.setup(comic: comic)
        XCTAssertEqual(cell?.banner.kf.webURL, comic?.getImage(size: .portraitMedium))
        XCTAssertEqual(cell?.label.text, comic?.title)
    }

}
