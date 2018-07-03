//
//  NetworkTests.swift
//  MarvelTests
//
//  Created by Juliano Terres on 30/06/18.
//  Copyright © 2018 Juliano Terres. All rights reserved.
//

import XCTest
@testable import Alamofire
@testable import Marvel

class NetworkTests: XCTestCaseBase {
    
    private var promise: XCTestExpectation!
    private var urlSuccess: URL!
    private var urlError: URL!
    private var parameters: Parameters!
    
    override func setUp() {
        super.setUp()
        promise = expectation(description: "waiting")
        urlSuccess = UrlDefinition.characters(offset: "0", limit: "1")
        urlError = UrlDefinition.testError()
        parameters = ["teste":1]
    }
    
    override func tearDown() {
        super.tearDown()
        promise = nil
        urlSuccess = nil
        urlError = nil
        parameters = nil
    }
    
    func testNetworkSuccess() {
        Network.request(url: urlSuccess, completion: { [weak self] (response) in
            XCTAssertNotNil(response)
            self?.promise.fulfill()
        }) { [weak self] (error) in
            XCTAssertNotNil(error)
            self?.promise.fulfill()
        }
        waitForExpectations(timeout: 20.0, handler: nil)
    }
    
    func testNetworkError() {
        Network.request(url: urlError, completion: { [weak self] (response) in
            XCTAssertNotNil(response)
            self?.promise.fulfill()
        }) { [weak self] (error) in
            XCTAssertNotNil(error)
            self?.promise.fulfill()
        }
        waitForExpectations(timeout: 20.0, handler: nil)
    }
    
    func testNetworkWithParameters() {
        Network.request(url: urlSuccess, method: .post, parameters: parameters, completion: { [weak self] (response) in
            XCTAssertNotNil(response)
            self?.promise.fulfill()
        }) { [weak self] (error) in
            XCTAssertNotNil(error)
            self?.promise.fulfill()
        }
        waitForExpectations(timeout: 20.0, handler: nil)
    }
    
}
