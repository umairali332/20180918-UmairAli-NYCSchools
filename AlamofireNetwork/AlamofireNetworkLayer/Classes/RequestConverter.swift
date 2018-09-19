//
//  RequestConverter.swift
//  Assignment
//
//  Created by Umair Ali on 9/18/18.
//  Copyright © 2018 Umair Ali. All rights reserved.
//

import Alamofire

public protocol RequestConverterProtocol: URLRequestConvertible {
    var method: HTTPMethod {get set}
    var route: String {get set}
    var parameters: Parameters? {get set}
}

/// Converter object that will allow us to play nicely with Alamofire
struct RequestConverter: RequestConverterProtocol {
    
    var method: HTTPMethod
    var route: String
    var parameters: Parameters?
    var urlEncoding : URLEncoding
    var httpHeaders : Dictionary<String,String>?
    
    init(method: HTTPMethod, route: String, parameters: Parameters? = nil, urlEncoding : URLEncoding = URLEncoding.default, httpHeaders : [String: String]? = nil) {
        self.method = method
        self.route = route
        self.parameters = parameters
        self.urlEncoding = urlEncoding
    }
    
    func asURLRequest() throws -> URLRequest {
        
        let url = try route.asURL()
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        
        // Set headers
        urlRequest.allHTTPHeaderFields = httpHeaders
        
        return try urlEncoding.encode(urlRequest, with: parameters)
    }
}


