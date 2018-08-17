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

protocol CharacterDetailViewModelProtocol {
    var character: Character { get set }
    func getTableViewIdentifier(section: Int) -> String
    func getTableViewHeightForRow(section: Int) -> CGFloat
    func getTableViewNumberRows(section: Int) -> Int
}

protocol CharacterListViewModelProtocol {
    
    //var service = CharacterService()
    var offset: Int { get set }
    var loadingActive: Bool { get set }
    var limit: Int { get set }
    var totalCharacters: Int { get set }
    var characters: [Character] { get set }
    
    func load(success: @escaping() -> Void, failure: @escaping(_ error: String) -> Void)
    func get(index: Int) -> Character
    func count() -> Int
    func checkAlreadyLoadedAll() -> Bool
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
