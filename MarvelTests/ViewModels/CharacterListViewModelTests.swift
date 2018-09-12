//
//  CharacterListViewModelTests.swift
//  MarvelTests
//
//  Created by Juliano Terres on 12/09/18.
//  Copyright © 2018 Juliano Terres. All rights reserved.
//

import XCTest
@testable import Marvel

class CharacterListViewModelTests: XCTestCaseBase {
    
    private var viewModel: CharacterListViewModel!
    private var service: CharacterServiceProtocol!
    
    override func tearDown() {
        super.tearDown()
    }
    
    func prepareViewController(returnType: EnumReturnType) {
        switch returnType {
        case .success:
            self.viewModel = CharacterListViewModel(service: CharacterServiceMock())
        case .error:
            self.viewModel = CharacterListViewModel(service: CharacterServiceErrorMock())
        default:
            self.viewModel = CharacterListViewModel(service: CharacterServiceCheckAllLoadingMock())
        }
    }
    
    func testLoadSuccess() {
        self.prepareViewController(returnType: .success)
        self.viewModel.load(success: {
            XCTAssertEqual(self.viewModel.characters.count, 20)
        }, failure: { error in
            XCTAssertNotNil(error)
        })
    }
    
    func testLoadError() {
        self.prepareViewController(returnType: .error)
        self.viewModel.load(success: {
            XCTAssertEqual(self.viewModel.characters.count, 0)
        }, failure: { error in
            XCTAssertNotNil(error)
        })
    }
    
    func testCount() {
        self.prepareViewController(returnType: .success)
        self.viewModel.load(success: {
            XCTAssertEqual(self.viewModel.count(), 20)
        }, failure: { error in
            XCTAssertNotNil(error)
        })
    }
    
    func testCheckAlreadyLoadedAllTrue() {
        self.prepareViewController(returnType: .success)
        self.viewModel.load(success: {
            XCTAssertEqual(self.viewModel.totalCharacters, 20)
            XCTAssertEqual(self.viewModel.checkAlreadyLoadedAll(), true)
        }, failure: { error in
            XCTAssertNotNil(error)
        })
    }
    
    func testCheckAlreadyLoadedAllFalse() {
        self.prepareViewController(returnType: .checkLoadAllCharacters)
        self.viewModel.load(success: {
            XCTAssertEqual(self.viewModel.totalCharacters, 100)
            XCTAssertEqual(self.viewModel.checkAlreadyLoadedAll(), false)
        }, failure: { error in
            XCTAssertNotNil(error)
        })
    }
    
}
