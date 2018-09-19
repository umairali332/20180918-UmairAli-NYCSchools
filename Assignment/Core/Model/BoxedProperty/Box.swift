//
//  Box.swift
//  Assignment
//
//  Created by Umair Ali on 4/9/18.
//  Copyright © 2018 Umair Ali. All rights reserved.
//

import Foundation

class Box<T> {
    
    typealias Listener = ((T) -> Void)
    
    private var listener : Listener?
    
    var value : T {
        
        didSet{
            
            listener?(value)
        }
    }
    
    init(_ value : T) {
        self.value = value
    }
    
    func bind(listener : @escaping Listener) {
        self.listener = listener
    }
}
