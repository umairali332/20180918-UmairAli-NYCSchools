//
//  Storyboard.swift
//  Assignment
//
//  Created by Umair Ali on 9/18/18.
//  Copyright © 2018 Umair Ali. All rights reserved.
//

import UIKit

enum Storyboard: String {
    case main = "Main"
}

extension Storyboard {
    
    private func storyboard() -> UIStoryboard {
        return UIStoryboard(name: self.rawValue, bundle: nil)
    }
    
    func instance(controller identifier: String) -> UIViewController {
        return self.storyboard().instantiateViewController(withIdentifier: identifier)
    }
    
    func instanceRoot() -> UIViewController? {
        return self.storyboard().instantiateInitialViewController()
    }
}
