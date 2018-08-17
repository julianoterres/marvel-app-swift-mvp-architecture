//
//  AppDelegate.swift
//  Marvel
//
//  Created by Juliano Terres on 25/06/18.
//  Copyright © 2018 Juliano Terres. All rights reserved.
//

import UIKit
import Fabric
import Crashlytics

//@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        Fabric.sharedSDK().debug = true
        Fabric.with([Crashlytics.self()])
        self.initMainScreen()
        return true
    }
    
    private func initMainScreen() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let navigationController = storyboard.instantiateViewController(withIdentifier: "CharacterListNavigationController") as? UINavigationController,
              let mainController = storyboard.instantiateViewController(withIdentifier: "CharacterListViewController") as? CharacterListViewController else { return }
        
        mainController.viewModel = CharacterListViewModel(service: CharacterService())
        navigationController.viewControllers = [mainController]
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()
    }
    
}
