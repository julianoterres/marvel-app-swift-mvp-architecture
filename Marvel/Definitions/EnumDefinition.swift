//
//  EnumDefinition.swift
//  Marvel
//
//  Created by Juliano Terres on 27/06/18.
//  Copyright © 2018 Juliano Terres. All rights reserved.
//

enum EnumNetworkMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

enum EnumImagesSizes: String {
    case landscapeXlarge = "landscape_xlarge"
    case landscapeIncredible = "landscape_incredible"
    case portraitMedium = "portrait_medium"
}

enum EnumCharacterListCellSection: Int {
    case character = 0
}

enum EnumCharacterListCellReusubleIdentifier: String {
    case character = "character"
}

enum EnumCharacterDetailCellReusubleIdentifier: String {
    case image = "image"
    case title = "title"
    case text = "text"
}

enum EnumCharacterDetailCellSection: Int {
    case banner = 0
    case description = 1
    case title = 2
    case itens = 3
}

