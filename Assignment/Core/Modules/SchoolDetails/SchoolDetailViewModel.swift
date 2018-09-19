//
//  SchoolDetailViewModel.swift
//  Assignment
//
//  Created by Umair Ali on 9/18/18.
//  Copyright © 2018 Umair Ali. All rights reserved.
//

import UIKit

class SchoolDetailViewModel: NSObject {
    
    var isDataLoaded = Box<Bool>(false)
    var errorOccurred = Box<String?>(nil)
    var schoolDetailModel : SchoolDetailAPIModel?
    var schoolAPIModel : SchoolAPIModel!
    
    private var dataStore : SchoolDataStore = SchoolAPIDataStore()
    
    public init(schoolAPIModel : SchoolAPIModel ,dataStore : SchoolDataStore = SchoolAPIDataStore()) {
        
        super.init()
        self.dataStore = dataStore
        self.schoolAPIModel = schoolAPIModel
        
    }
    
    
    
    func fetchTestData() {
        
        let request = SchoolDetailRequestModel(dbn: schoolAPIModel.dbn)
        dataStore.getSchoolDetail(request: request) {[weak self] (result) in
            
            guard let selfStrong = self else {
                
                return
            }
            
            switch result {
                
            case .success(let data):
                self?.schoolDetailModel = data.first
                self?.isDataLoaded.value = true
                print("Success")
                
            case .failure(let error):
                selfStrong.errorOccurred.value = error.description
            }
        }
    }
}
