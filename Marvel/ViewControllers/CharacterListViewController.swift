//
//  CharacterListViewController.swift
//  Marvel
//
//  Created by Juliano Terres on 25/06/18.
//  Copyright © 2018 Juliano Terres. All rights reserved.
//

import UIKit

class CharacterListViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var loaderMain: UIActivityIndicatorView!
    @IBOutlet weak var tableViewFooter: UIView!
    
    let characterListViewModel = CharacterListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        load()
    }
    
    func load() {
        characterListViewModel.load(success: { [weak self] in
            self?.reloadTable()
        }) { [weak self] (error) in
            self?.loaderMain.isHidden = true
            self?.showAlert(title: "Sorry", message: error, buttonText: "Try again")
        }
    }
    
    func reloadTable() {
        self.tableView.reloadData()
        self.tableView.isHidden = false
        self.loaderMain.isHidden = true
        self.tableViewFooter.frame.size.height = characterListViewModel.heightFooter()
    }
    
}

//MARK: Methods of UITableViewDelegate and UITableViewDataSource

extension CharacterListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characterListViewModel.count()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CharacterListCell.height
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CharacterListCell = tableView.dequeueReusableCell(withIdentifier: "character", for: indexPath) as! CharacterListCell
        cell.character = characterListViewModel.get(index: indexPath.row)
        cell.setup()
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.navigationController?.goToCharacterDetailScreen(character: characterListViewModel.get(index: indexPath.row))
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let contentOffset = scrollView.contentOffset.y
        let maximumOffset = scrollView.contentSize.height - scrollView.frame.size.height
        if contentOffset == maximumOffset {
            load()
        }
    }
    
}
