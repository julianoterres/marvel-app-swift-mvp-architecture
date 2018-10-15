//
//  CharacterDetailCell.swift
//  Marvel
//
//  Created by Juliano Terres on 26/06/18.
//  Copyright © 2018 Juliano Terres. All rights reserved.
//

import UIKit
import Kingfisher

class CharacterDetailComicCell: UITableViewCell {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var banner: UIImageView!
    
    static let heigthHeader = CGFloat(30)
    static let height = CGFloat(90)
    
    func setup(comic: Comic?) {
        self.label.text = comic?.title
        guard let url = comic?.getImage(size: .portraitMedium) else { return }
        self.banner.kf.setImage(with: url, placeholder: UIImage.placeholderBanner())
    }
    
}
