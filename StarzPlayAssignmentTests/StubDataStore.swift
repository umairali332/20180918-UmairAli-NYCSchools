//
//  StubDataStore.swift
//  AssignmentTests
//
//  Created by Umair Ali on 4/10/18.
//  Copyright © 2018 Umair Ali. All rights reserved.
//

import Foundation

@testable import Assignment
@testable import AlamofireNetworkLayer

class ErrorResultStubSchoolDataStore: SchoolDataStore {
    func getSchoolList(request: SchoolRequestModel, onCompletion: @escaping (ResultType<[SchoolAPIModel]>) -> Void) {
        let error:NetworkError = .ServerError(message: "Something went wrong or network issue")
        let result:ResultType<[SchoolAPIModel]> = .failure(error)
        
        onCompletion(result)
    }
    
    func getSchoolDetail(request: SchoolDetailRequestModel, onCompletion: @escaping (ResultType<[SchoolDetailAPIModel]>) -> Void) {
        let error:NetworkError = .ServerError(message: "Something went wrong or network issue")
        let result:ResultType<[SchoolDetailAPIModel]> = .failure(error)
        
        onCompletion(result)
    }
}
