//
//  AlamofireNetwork.swift
//  StarzPlayAssignment
//
//  Created by Umair Ali on 4/8/18.
//  Copyright © 2018 Umair Ali. All rights reserved.
//

import Alamofire

class AlamofireNetwork: Networking {
    
    static let shared : AlamofireNetwork = AlamofireNetwork(translation: JSONTranslation())
    
    let translation:TranslationLayer
    
    init(translation:TranslationLayer) {
        self.translation = translation
    }
    
    let manager:SessionManager = {
        let configuration = URLSessionConfiguration.background(withIdentifier: "com.starzPlayAssigment.app.background")
        return Alamofire.SessionManager(configuration: configuration)
    }()
    
    func requestObject<T:Decodable>( _ requestConverter : RequestConverterProtocol, completionHandler : @escaping  DataResponseHandler<T>) -> Void {
        
        manager
            .request(requestConverter)
            .validate()
            .responseDecodable(translation: translation){ (response:DataResponse<T>) in
                print(response.request as Any)  // original URL request
                print(response.response as Any) // HTTP URL response
                print(response.data as Any)     // server data
                print(response.result as Any)   // result of response serialization
                switch response.result {
                case .success(let value):
                    completionHandler(.init(result: .success(value)))
                case .failure(let error as NetworkError):
                    completionHandler(.init(result: .failure(error)))
                default:break
                }
        }
    }
}

extension DataRequest {
    
    @discardableResult
    func responseDecodable<T: Decodable>(
        translation:TranslationLayer,
        queue: DispatchQueue? = nil,
        completionHandler: @escaping (DataResponse<T>) -> Void)
        -> Self
    {
        let responseSerializer = DataResponseSerializer<T> { request, response, data, error in
            guard error == nil else {
                return .failure(NetworkError(error: error! as NSError))
            }
            let jsonResponseSerializer = DataRequest.dataResponseSerializer()
            let result = jsonResponseSerializer.serializeResponse(request, response, data, nil)
            guard case let .success(dataObject) = result else {
                return .failure(NetworkError(error: result.error! as NSError))
            }
            do {
                return .success(try translation.decode(withData: dataObject))
            } catch let error {
                print(error)
                let error:NetworkError = .ServerError(message: "JSON could not be serialized: \(error)")
                return .failure(error)
            }
        }
        return response(queue: queue, responseSerializer: responseSerializer, completionHandler: completionHandler)
    }
}
