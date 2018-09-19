//
//  DataResponseModel.swift
//  StarzPlayAssignment
//
//  Created by Umair Ali on 4/8/18.
//  Copyright © 2018 Umair Ali. All rights reserved.
//

import Foundation

enum ResultType<T> {
    
    case success(T)
    case failure(NetworkError)
}

struct DataResponseModel<T> {
    
    let result : ResultType<T>
}
