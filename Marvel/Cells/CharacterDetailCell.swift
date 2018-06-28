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
        switch indexPath.section {
            case 0:
                setupBanner()
            case 1:
                setupDescription()
            case 2:
                setupTitle()
            default:
                setupComics()
        }
    }
    
    private func setupBanner() {
        banner.kf.setImage(with: character.getAvatarUrl(size: .landscapeIncredible), placeholder: UIImage.placeholderBanner())
    }
    
    private func setupTitle() {
        if !descriptionExist() {
            consTitleTop.constant = 0
            consSeparatorTop.constant = 0
            self.separator.isHidden = true
        }
        self.title.text = "Comics"
    }
    
    private func setupDescription() {
        self.item.text = character.desc
    }
    
    private func setupComics() {
        guard let comics = character.comics, let itens = comics.items else { return }
        let item = itens[indexPath.row]
        self.item.text = item.name ?? "Comic without name"
    }
    
    private func descriptionExist() -> Bool {
        if let desc = character.desc, desc != "" {
            return true
        }
        return false
    }
    
}
