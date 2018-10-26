//
//  EnumDefinition.swift
//  Marvel
//
//  Created by Juliano Terres on 27/06/18.
//  Copyright © 2018 Juliano Terres. All rights reserved.
//

enum ImagesSizes: String {
    case landscapeXlarge = "landscape_xlarge"
    case landscapeIncredible = "landscape_incredible"
    case portraitMedium = "portrait_medium"
}

enum CharacterListCellSection: Int {
    case character
}

enum CharacterDetailComicCellSection: Int {
    case comic
}

enum CharacterListCellReusubleIdentifier: String {
    case character
}

enum CharacterDetailCellReusubleIdentifier: String {
    case comic
}
