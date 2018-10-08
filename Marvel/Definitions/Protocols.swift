//
//  Protocols.swift
//  Marvel
//
//  Created by Juliano Terres on 08/08/18.
//  Copyright © 2018 Juliano Terres. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

protocol CharacterListViewControllerProtocol {
    func reloadCharacters()
    func showError(message: String)
}

protocol CharacterListPresenterProtocol {
    func load()
    func checkAlreadyLoadedAll() -> Bool
    func getCharacters(index: Int) -> Character
    func countCharacters() -> Int
}

protocol CharacterServiceProtocol {
    func getAllWithPagination(
        offset: String,
        limit: String,
        success: @escaping(_ characters: [Character], _ totalCharacters: Int) -> Void,
        failure: @escaping(_ message: String) -> Void
    )
}

protocol NetworkProtocol {
    static func request(url: URL, method: HTTPMethod, parameters: Parameters?, completion: @escaping (Data) -> Void, failure: @escaping(_ error: String) -> Void)
}
