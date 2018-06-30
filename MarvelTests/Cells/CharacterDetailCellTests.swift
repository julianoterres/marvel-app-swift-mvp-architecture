//
//  CharacterDetailCellTests.swift
//  MarvelTests
//
//  Created by Juliano Terres on 29/06/18.
//  Copyright © 2018 Juliano Terres. All rights reserved.
//

import XCTest
@testable import ObjectMapper
@testable import Kingfisher
@testable import Marvel

class CharacterDetailCellTests: XCTestCaseBase {
    
    private var characterDetailCell = CharacterDetailCell()
    private var character: Marvel.Character!
    
    override func setUp() {
        super.setUp()
        
        guard let characterMock = getCharacter() else {
            XCTFail("Failed get character")
            return
        }
        
        character = characterMock
        characterDetailCell.character = character
        
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testCell() {
        
//        @IBOutlet weak var banner: UIImageView!
//        @IBOutlet weak var title: UILabel!
//        @IBOutlet weak var item: UILabel!
//        @IBOutlet weak var separator: UIView!
//        @IBOutlet weak var consTitleTop: NSLayoutConstraint!
//        @IBOutlet weak var consSeparatorTop: NSLayoutConstraint!
        //characterDetailCell.indexPath = IndexPath.init(row: 0, section: 0)
        //characterDetailCell.setup()
        //XCTAssertEqual(characterDetailCell.banner.kf.webURL, character.getImage(size: .landscapeIncredible), "Erro")
        
        
    }
    
}

