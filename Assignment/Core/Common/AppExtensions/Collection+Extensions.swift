//
//  Collection+Extensions.swift
//  Assignment
//
//  Created by Umair Ali on 4/9/18.
//  Copyright © 2018 Umair Ali. All rights reserved.
//

import Foundation

extension Collection {
    
    /// Returns the element at the specified index iff it is within bounds, otherwise nil.
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
