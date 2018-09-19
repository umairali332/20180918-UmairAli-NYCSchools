//
//  AppDelegate.swift
//  Assignment
//
//  Created by Umair Ali on 9/18/18.
//  Copyright © 2018 Umair Ali. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    var appCoordinator : AppCoordinator!
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        UIStoryboardSegue.addCoordination()
        uiSettings()
        
        guard let controller = self.window?.rootViewController as? UINavigationController,
            let rootController = controller.topViewController as? ListingViewController else {
                fatalError("No root Coordinated controller")
        }
        self.appCoordinator = AppCoordinator(rootController: rootController)
        self.appCoordinator.start()
        return true
    }

    func uiSettings() {
        
        UIApplication.shared.statusBarStyle = .lightContent
    }
}

