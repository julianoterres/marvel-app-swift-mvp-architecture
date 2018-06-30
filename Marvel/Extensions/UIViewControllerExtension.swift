//
//  UIViewControllerExtension.swift
//  Marvel
//
//  Created by Juliano Terres on 27/06/18.
//  Copyright © 2018 Juliano Terres. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func preload() {
        _ = self.view
    }
    
    func showAlert(title: String, message: String, buttonText: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: buttonText, style: .cancel) { (action) in }
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
}
