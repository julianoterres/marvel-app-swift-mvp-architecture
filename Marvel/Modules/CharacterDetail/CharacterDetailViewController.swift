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
    
    @IBOutlet weak var bannerHeight: NSLayoutConstraint!
    @IBOutlet weak var textBottom: NSLayoutConstraint!
    @IBOutlet weak var tableHeight: NSLayoutConstraint!
    
    private let heightTextBottom = CGFloat(20)
    var character: Character!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }
    
    func setup() {
        self.title = self.character.name
        self.setupBanner()
        self.setupText()
        self.setupTable()
    }
    
    func setupBanner() {
        self.banner.kf.setImage(with: character.getImage(size: .landscapeIncredible), placeholder: UIImage.placeholderBanner())
        self.bannerHeight.constant = UIScreen.main.bounds.width * 0.5
    }
    
    func setupText() {
        self.text.text = self.character.description
        self.textBottom.constant = (self.character.description!.isEmpty) ? 0 : heightTextBottom
    }
    
    func setupTable() {
        let totalComics = self.character.comics?.items?.count ?? 0
        let tableHeight = (totalComics >= 1) ? ((CGFloat(totalComics) * CharacterDetailComicCell.height) + CharacterDetailComicCell.heigthHeader) : 0
        self.tableHeight.constant = tableHeight
    }

}

// MARK: Methods of UITableViewDelegate and UITableViewDataSource

extension CharacterDetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.character.comics?.items?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CharacterDetailComicCell.height
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // swiftlint:disable force_cast
        let cell = tableView.dequeueReusableCell(withIdentifier: CharacterDetailCellReusubleIdentifier.comic.rawValue, for: indexPath) as! CharacterDetailComicCell
        cell.setup(comic: self.character.comics?.items?[indexPath.row])
        return cell
    }
    
}
