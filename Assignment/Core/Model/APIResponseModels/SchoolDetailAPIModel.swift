//
//  SchoolDetailAPIModel.swift
//  Assignment
//
//  Created by Umair Ali on 9/18/18.
//  Copyright © 2018 Umair Ali. All rights reserved.
//

import UIKit

struct SchoolDetailAPIModel: Decodable {
    var schoolName = ""
    var satTestTaker = ""
    var satReadingScore = ""
    var satMathScore = ""
    var satWritingScore = ""
    var dbn = ""
    
    enum CodingKeys : String, CodingKey {
        case schoolName = "school_name"
        case satTestTaker = "num_of_sat_test_takers"
        case satReadingScore = "sat_critical_reading_avg_score"
        case satMathScore = "sat_math_avg_score"
        case satWritingScore = "sat_writing_avg_score"
        case dbn
        
    }
}

