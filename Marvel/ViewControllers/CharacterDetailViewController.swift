//
//  CharacterDetailViewController.swift
//  Marvel
//
//  Created by Juliano Terres on 26/06/18.
//  Copyright © 2018 Juliano Terres. All rights reserved.
//

import UIKit

class CharacterDetailViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!

}

//MARK: Methods of UITableViewDelegate and UITableViewDataSource

extension CharacterDetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var totalRows = 1
        
        if section == 3 {
            totalRows = 20
        }
        
        return totalRows
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        var height = UITableViewAutomaticDimension
        
        if indexPath.section == 0 {
            height = 153
        }
        
        return height
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var identifier = ""
        
        switch indexPath.section {
            case 0:
                identifier = "image"
            case 2:
                identifier = "title"
            default:
                identifier = "text"
        }
        
        let cell: CharacterDetailCell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! CharacterDetailCell
        
        return cell
    }
    
}

