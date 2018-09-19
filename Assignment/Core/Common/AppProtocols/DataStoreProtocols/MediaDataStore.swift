//
//  SchoolDataStore.swift
//  Assignment
//
//  Created by Umair Ali on 9/18/18.
//  Copyright © 2018 Umair Ali. All rights reserved.
//

import Foundation
import AlamofireNetworkLayer


protocol SchoolDataStore {
    
    func getSchoolList( request: SchoolRequestModel, onCompletion : @escaping ResultHandler<[SchoolAPIModel]>)
    
    func getSchoolDetail( request: SchoolDetailRequestModel, onCompletion : @escaping ResultHandler<[SchoolDetailAPIModel]>)
}
