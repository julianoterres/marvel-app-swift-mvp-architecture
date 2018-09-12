//
//  CharacterDetailCell.swift
//  Marvel
//
//  Created by Juliano Terres on 26/06/18.
//  Copyright © 2018 Juliano Terres. All rights reserved.
//

import UIKit
import Kingfisher

class CharacterDetailCell: UITableViewCell {
    
    @IBOutlet weak var banner: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var item: UILabel!
    @IBOutlet weak var separator: UIView!
    @IBOutlet weak var consTitleTop: NSLayoutConstraint!
    @IBOutlet weak var consSeparatorTop: NSLayoutConstraint!
    
    var character = Character()
    var indexPath = IndexPath()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setup() {
        switch self.indexPath.section {
        case EnumCharacterDetailCellSection.banner.rawValue:
            self.setupBanner()
        case EnumCharacterDetailCellSection.description.rawValue:
            self.setupDescription()
        case EnumCharacterDetailCellSection.title.rawValue:
            self.setupTitle()
        default:
            self.setupComics()
        }
    }
    
    private func setupBanner() {
        self.banner.kf.setImage(with: character.getImage(size: .landscapeIncredible), placeholder: UIImage.placeholderBanner())
    }
    
    private func setupTitle() {
        if !self.descriptionExist() {
            self.consTitleTop.constant = 0
            self.consSeparatorTop.constant = 0
            self.separator.isHidden = true
        } else {
            self.title.text = "Comics"
        }
    }
    
    private func setupDescription() {
        self.item.text = character.description
    }
    
    private func setupComics() {
        guard let comics = self.character.comics, let itens = comics.items else { return }
        let item = itens[self.indexPath.row]
        self.item.text = item.name ?? "Comic without name"
    }
    
    internal func descriptionExist() -> Bool {
        if let desc = self.character.description, !desc.isEmpty {
            return true
        }
        return false
    }
    
}
