//
//  DataResponseModel.swift
//  Assignment
//
//  Created by Umair Ali on 9/18/18.
//  Copyright © 2018 Umair Ali. All rights reserved.
//

import Foundation

public enum ResultType<T> {
    
    case success(T)
    case failure(NetworkError)
}

public struct DataResponseModel<T> {
    
    public let result : ResultType<T>
}
