//
//  AppCoordinator.swift
//  Assignment
//
//  Created by Umair Ali on 9/18/18.
//  Copyright © 2018 Umair Ali. All rights reserved.
//

import UIKit


class AppCoordinator : Coordinator {
    
    fileprivate var rootViewController : ListingViewController
    fileprivate var schoolDetailsCoordinator : SchoolDetailsCoordinator!
    fileprivate var selectedItem : SchoolAPIModel?
    
    init(rootController : ListingViewController) {
        
        rootViewController = rootController
        rootViewController.delegate = self
    }
    
    func start() {
        
        rootViewController.coordinationDelegate = self
    }
}


extension AppCoordinator : CoordinationDelegate {
    
    func coordinate(from source: Coordinated, to destination: UIViewController, identifier id: String?) {
        
        if id == StoryboardSegueIdentifier.showItemDetails {
            
            guard let vc = destination as? SchoolDetailsViewController else {
                return
            }
            vc.schoolItem = selectedItem!
            schoolDetailsCoordinator = SchoolDetailsCoordinator(vc)
            schoolDetailsCoordinator.start()
        }
    }
}

extension AppCoordinator : AppCoordinatorDelegate {    
    
    func schoolItemSelected(_ item: SchoolAPIModel) {
        self.selectedItem = item
        rootViewController.performSegue(withIdentifier: StoryboardSegueIdentifier.showItemDetails, sender: nil)
    }
}
