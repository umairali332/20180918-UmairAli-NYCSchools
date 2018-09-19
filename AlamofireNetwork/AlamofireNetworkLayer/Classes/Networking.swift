//
//  Networking.swift
//  Assignment
//
//  Created by Umair Ali on 9/18/18.
//  Copyright © 2018 Umair Ali. All rights reserved.
//

import Foundation

public typealias DataResponseHandler<T> = (DataResponseModel<T>) -> Void
public typealias ResultHandler<T> = (ResultType<T>) -> Void


public protocol Networking {
    
    func requestObject<T:Decodable>( _ requestConverter : RequestConverterProtocol, completionHandler : @escaping  DataResponseHandler<T>) -> Void
}
