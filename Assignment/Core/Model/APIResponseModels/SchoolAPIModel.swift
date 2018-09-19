//
//  SchoolAPIModel.swift
//  Assignment
//
//  Created by Umair Ali on 9/18/18.
//  Copyright © 2018 Umair Ali. All rights reserved.
//

import UIKit

struct SchoolAPIModel: Decodable {
    var schoolName = ""
    var zip = ""
    var stateCode = ""
    var dbn = ""
    var city = ""
    var borough = ""
    
    enum CodingKeys : String, CodingKey {
        case schoolName = "school_name"
        case zip
        case stateCode = "state_code"
        case dbn
        case city
        case borough
        
    }
}

extension SchoolAPIModel {
    var details : String {
        return "\(borough) \(city) \(stateCode) \(zip)"
    }
}
