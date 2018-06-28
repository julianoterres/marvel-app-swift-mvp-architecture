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
    var character: Character?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setup() {
        guard let character = character, let url = character.getAvatarUrl(size: .portraitMedium) else { return }
        name.text = character.name
        avatar.kf.setImage(with: url, placeholder: UIImage.placeholderAvatar())
    }

}
