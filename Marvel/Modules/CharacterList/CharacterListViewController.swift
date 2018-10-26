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
    
    var presenter: CharacterListPresenterProtocol!
    var characters = [Character]()
    private let footerHeigth = CGFloat(44)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Characters"
        self.presenter.load()
    }
    
}

// MARK: Methods of CharacterListViewControllerProtocol

extension CharacterListViewController: CharacterListViewControllerProtocol {
    
    func reloadCharacters(characters: [Character], hideLoader: Bool) {
        self.characters = characters
        self.tableViewFooter.frame.size.height = (hideLoader) ? 0 : self.footerHeigth
        self.tableView.reloadData()
        self.tableView.isHidden = false
        self.loaderMain.isHidden = true
    }
    
    func showError(message: String) {
        self.loaderMain.isHidden = true
        self.showAlert(title: "Sorry", message: message, buttonText: "Try again")
    }
    
}

// MARK: Methods of UITableViewDelegate and UITableViewDataSource

extension CharacterListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.characters.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CharacterListCell.height
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // swiftlint:disable force_cast
        let cell: CharacterListCell = tableView.dequeueReusableCell(withIdentifier: CharacterListCellReusubleIdentifier.character.rawValue, for: indexPath) as! CharacterListCell
        cell.setup(character: self.characters[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.navigationController?.goToCharacterDetailScreen(character: self.characters[indexPath.row])
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y == (scrollView.contentSize.height - scrollView.frame.size.height) {
            self.presenter.load()
        }
    }
    
}
