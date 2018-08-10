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
    
    var viewModel: CharacterDetailViewModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = self.viewModel.character.name
    }

}

// MARK: Methods of UITableViewDelegate and UITableViewDataSource

extension CharacterDetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.getTableViewNumberRows(section: section)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.viewModel.getTableViewHeightForRow(section: indexPath.section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = CharacterDetailCell()
        let identifier = self.viewModel.getTableViewIdentifier(section: indexPath.section)
        if let cellIdentier = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? CharacterDetailCell {
            cell = cellIdentier
            cell.character = self.viewModel.character
            cell.indexPath = indexPath
            cell.setup()
        }
        return cell
    }
    
}
