//
//  SchoolRequestModel.swift
//  Assignment
//
//  Created by Umair Ali on 9/18/18.
//  Copyright © 2018 Umair Ali. All rights reserved.
//

import Foundation

struct SchoolRequestModel:Codable {
    
    let limit:Int
    let offset:Int
    
    private enum CodingKeys: String, CodingKey {
        case limit = "$limit"
        case offset = "$offset"
    }
    
}
