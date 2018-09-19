//
//  BaseUrlRouter.swift
//  Assignment
//
//  Created by Umair Ali on 9/18/18.
//  Copyright © 2018 Umair Ali. All rights reserved.
//

import Foundation

public protocol BaseUrlRouter {
    
    static var basePath : String { get set }
    
}

public extension BaseUrlRouter {
    
    static var basePath : String {
        get {
            
            return "https://data.cityofnewyork.us/resource"
        }
        
        set{
            
        }
    }
    
}

