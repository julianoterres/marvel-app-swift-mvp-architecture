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
    
    var characterDetailViewModel = CharacterDetailViewModel()
    var character = Character()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = character.name ?? "Without name"
        characterDetailViewModel.character = character
    }

}

// MARK: Methods of UITableViewDelegate and UITableViewDataSource

extension CharacterDetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characterDetailViewModel.getTableViewNumberRows(section: section)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return characterDetailViewModel.getTableViewHeightForRow(section: indexPath.section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = characterDetailViewModel.getTableViewIdentifier(section: indexPath.section)
        guard let cell: CharacterDetailCell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? CharacterDetailCell else {
            return UITableViewCell()
        }
        cell.character = character
        cell.indexPath = indexPath
        cell.setup()
        return cell
    }
    
}
