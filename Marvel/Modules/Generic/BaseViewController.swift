//
//  BaseViewController.swift
//  Marvel
//
//  Created by Juliano Terres on 26/06/18.
//  Copyright © 2018 Juliano Terres. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.changeBackButtonImage()
    }
    
}
