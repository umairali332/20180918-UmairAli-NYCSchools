//
//  Networking.swift
//  StarzPlayAssignment
//
//  Created by Umair Ali on 4/8/18.
//  Copyright © 2018 Umair Ali. All rights reserved.
//

import Foundation

typealias DataResponseHandler<T> = (DataResponseModel<T>) -> Void
typealias ResultHandler<T> = (ResultType<T>) -> Void


protocol Networking {
    
    func requestObject<T:Decodable>( _ requestConverter : RequestConverterProtocol, completionHandler : @escaping  DataResponseHandler<T>) -> Void
}
