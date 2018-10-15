//
//  CharacterDetailViewController.swift
//  Marvel
//
//  Created by Juliano Terres on 26/06/18.
//  Copyright © 2018 Juliano Terres. All rights reserved.
//

import UIKit

class CharacterDetailViewController: BaseViewController {

    @IBOutlet weak var banner: UIImageView!
    @IBOutlet weak var text: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var loader: UIActivityIndicatorView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var notFoundData: UILabel!
    
    @IBOutlet weak var bannerHeight: NSLayoutConstraint!
    @IBOutlet weak var textBottom: NSLayoutConstraint!
    @IBOutlet weak var tableHeight: NSLayoutConstraint!
    
    private let heightTextBottom = CGFloat(20)
    var presenter: CharacterDetailPresenterProtocol!
    var character: Character!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = self.character.name
        self.presenter.loadComics()
    }

}

// MARK: Methods of CharacterDetailViewControllerProtocol

extension CharacterDetailViewController: CharacterDetailViewControllerProtocol {
    
    func showDetails(character: Character?) {
        self.character = character

        self.banner.kf.setImage(with: self.character.getImage(size: .landscapeIncredible), placeholder: UIImage.placeholderBanner())
        self.bannerHeight.constant = UIScreen.main.bounds.width * 0.5
        
        self.text.text = self.character.description
        self.textBottom.constant = (self.character.description!.isEmpty) ? 0 : heightTextBottom
        let totalComics = self.character.listComics?.count ?? 0
        
        let tableHeight = (totalComics >= 1) ? ((CGFloat(totalComics) * CharacterDetailComicCell.height) + CharacterDetailComicCell.heigthHeader) : 0
        self.tableHeight.constant = tableHeight

        self.tableView.reloadData()
        self.loader.stopAnimating()
        self.scrollView.isHidden = false
    }
    
    func showError(message: String) {
        self.loader.stopAnimating()
        self.notFoundData.text = message
        self.notFoundData.isHidden = false
        self.scrollView.isHidden = true
    }
    
}

// MARK: Methods of UITableViewDelegate and UITableViewDataSource

extension CharacterDetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.character.listComics?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CharacterDetailComicCell.height
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // swiftlint:disable force_cast
        let cell = tableView.dequeueReusableCell(withIdentifier: CharacterDetailCellReusubleIdentifier.comic.rawValue, for: indexPath) as! CharacterDetailComicCell
        cell.setup(comic: self.character.listComics?[indexPath.row])
        return cell
    }
    
}
