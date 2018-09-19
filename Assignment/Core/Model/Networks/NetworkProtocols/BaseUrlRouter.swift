//
//  BaseUrlRouter.swift
//  StarzPlayAssignment
//
//  Created by Umair Ali on 4/8/18.
//  Copyright © 2018 Umair Ali. All rights reserved.
//

import Foundation

protocol BaseUrlRouter {
    
    static var basePath : String { get set }
    
}

extension BaseUrlRouter {
    
    static var basePath : String {
        get {
            
            return "https://api.themoviedb.org/3/search"
        }
        
        set{
            
        }
    }
    
}

