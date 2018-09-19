//
//  SchoolDetailsCoordinator.swift
//  Assignment
//
//  Created by Umair Ali on 4/9/18.
//  Copyright © 2018 Umair Ali. All rights reserved.
//

import UIKit

class SchoolDetailsCoordinator : Coordinator {
    
    var rootController : SchoolDetailsViewController
    
    init(_ controller : SchoolDetailsViewController) {
        
        rootController = controller
    }
    
    func start() {
        
        rootController.coordinationDelegate = self as? CoordinationDelegate
    }
    
    
    
}

extension SchoolDetailsViewController : CoordinationDelegate {
    func coordinate(from source: Coordinated, to destination: UIViewController, identifier id: String?) {
        
    }
}
