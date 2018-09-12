//
//  CharacterListViewController.swift
//  Marvel
//
//  Created by Juliano Terres on 25/06/18.
//  Copyright © 2018 Juliano Terres. All rights reserved.
//

import UIKit
import Alamofire
import Crashlytics

class CharacterListViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var loaderMain: UIActivityIndicatorView!
    @IBOutlet weak var tableViewFooter: UIView!
    @IBOutlet weak var tableViewBottomConstraint: NSLayoutConstraint!
    
    var viewModel: CharacterListViewModelProtocol!
    private let footerHeigth = CGFloat(44)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Characters"
        self.load()
    }
    
    func load() {
        self.viewModel.load(success: { [weak self] in
            self?.reloadTable()
        }, failure: { [weak self] error in
            self?.loaderMain.isHidden = true
            self?.showAlert(title: "Sorry", message: error, buttonText: "Try again")
        })
    }
    
    func reloadTable() {
        self.tableViewFooter.frame.size.height = footerHeight()
        self.tableView.reloadData()
        self.tableView.isHidden = false
        self.loaderMain.isHidden = true
    }
    
    func footerHeight() -> CGFloat {
        return (viewModel.checkAlreadyLoadedAll()) ? 0 : footerHeigth
    }
    
}

// MARK: Methods of UITableViewDelegate and UITableViewDataSource

extension CharacterListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.count()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CharacterListCell.height
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: CharacterListCell = tableView.dequeueReusableCell(withIdentifier: EnumCharacterListCellReusubleIdentifier.character.rawValue, for: indexPath) as? CharacterListCell else {
            return UITableViewCell()
        }
        cell.character = self.viewModel.get(index: indexPath.row)
        cell.setup()
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.navigationController?.goToCharacterDetailScreen(character: self.viewModel.get(index: indexPath.row))
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let contentOffset = scrollView.contentOffset.y
        let maximumOffset = scrollView.contentSize.height - scrollView.frame.size.height
        if contentOffset == maximumOffset {
            self.load()
        }
    }
    
}
