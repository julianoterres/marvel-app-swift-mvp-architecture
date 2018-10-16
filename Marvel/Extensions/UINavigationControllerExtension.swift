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
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let controller = storyboard.instantiateViewController(withIdentifier: "CharacterDetailViewController") as? CharacterDetailViewController {
            controller.presenter = CharacterDetailPresenter(view: controller, service: CharacterService(), character: character)
            controller.character = character
            self.pushViewController(controller, animated: true)
        }
    }
    
    func changeBackButtonImage() {
        let image = UIImage(named: "arrowLeftWhite")
        self.navigationBar.backIndicatorImage = image
        self.navigationBar.backIndicatorTransitionMaskImage = image
    }
    
}
