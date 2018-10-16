//
//  CharacterListCell.swift
//  Marvel
//
//  Created by Juliano Terres on 26/06/18.
//  Copyright © 2018 Juliano Terres. All rights reserved.
//

import UIKit
import Kingfisher

class CharacterListCell: UITableViewCell {

    @IBOutlet weak var avatar: UIImageViewCustom!
    @IBOutlet weak var name: UILabel!
    
    static let height = CGFloat(57)
    
    func setup(character: Character) {
        self.name.text = character.name
        guard let url = character.getImage(size: .portraitMedium) else { return }
        self.avatar.kf.setImage(with: url, placeholder: UIImage.placeholderAvatar())
    }

}
