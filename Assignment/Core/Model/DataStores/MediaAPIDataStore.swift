//
//  SchoolAPIDataStore.swift
//  Assignment
//
//  Created by Umair Ali on 9/18/18.
//  Copyright © 2018 Umair Ali. All rights reserved.
//

import Foundation
import AlamofireNetworkLayer

struct SchoolAPIDataStore : SchoolDataStore {
    
    let networking : Networking = AlamofireNetwork.shared
    let translation:TranslationLayer = JSONTranslation()
    
    func getSchoolList(request: SchoolRequestModel, onCompletion: @escaping (ResultType<[SchoolAPIModel]>) -> Void) {
        
        guard let requestParams = try? translation.encode(withModel: request) else { onCompletion(.failure(.RequestFailed)); return  }
        
        networking.requestObject(MediaAPIRouter.School.get(parameters: requestParams)) { (response:DataResponseModel<[SchoolAPIModel]>) in
            
            onCompletion(response.result)
        }
    }
    
    func getSchoolDetail( request: SchoolDetailRequestModel, onCompletion : @escaping ResultHandler<[SchoolDetailAPIModel]>) {
        
        guard let requestParams = try? translation.encode(withModel: request) else { onCompletion(.failure(.RequestFailed)); return  }
        
        networking.requestObject(MediaAPIRouter.SchoolDetails.get(parameters: requestParams)) { (response:DataResponseModel<[SchoolDetailAPIModel]>) in
            
            onCompletion(response.result)
        }
    }
}
