//
//  EnumDefinition.swift
//  Marvel
//
//  Created by Juliano Terres on 27/06/18.
//  Copyright © 2018 Juliano Terres. All rights reserved.
//

enum EnumImagesSizes: String {
    case landscapeXlarge = "landscape_xlarge"
    case landscapeIncredible = "landscape_incredible"
    case portraitMedium = "portrait_medium"
}

enum EnumCharacterListCellSection: Int {
    case character
}

enum EnumCharacterListCellReusubleIdentifier: String {
    case character
}

enum EnumCharacterDetailCellReusubleIdentifier: String {
    case image
    case title
    case text
}

enum EnumCharacterDetailCellSection: Int {
    case banner
    case description
    case title
    case itens
}
