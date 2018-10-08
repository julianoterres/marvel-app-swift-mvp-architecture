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
    
    static let heigthHeader = CGFloat(30)
    static let height = CGFloat(30)
    
    func setup(comic: Items?) {
        self.label.text = comic?.name
    }
    
}
