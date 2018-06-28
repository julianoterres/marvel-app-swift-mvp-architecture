//
//  UINavigationControllerExtension.swift
//  Marvel
//
//  Created by Juliano Terres on 26/06/18.
//  Copyright © 2018 Juliano Terres. All rights reserved.
//

import UIKit

extension UINavigationController {
    
    func goToCharacterDetailScreen(character: Character) {
        let controller: CharacterDetailViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CharacterDetailViewController") as! CharacterDetailViewController
        controller.character = character
        self.openWithPush(controller: controller)
    }
    
    func openWithPush(controller: UIViewController) {
        self.pushViewController(controller, animated: true)
    }
    
    func changeBackButtonImage() {
        let image = UIImage(named: "arrowLeftWhite")
        self.navigationBar.backIndicatorImage = image
        self.navigationBar.backIndicatorTransitionMaskImage = image
    }
    
}


