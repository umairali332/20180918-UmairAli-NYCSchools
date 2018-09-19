//
//  ListingViewModel.swift
//  Assignment
//
//  Created by Umair Ali on 9/18/18.
//  Copyright © 2018 Umair Ali. All rights reserved.
//

import Foundation

class ListingViewModel : NSObject {
    
    
    
    var isDataLoaded = Box<Bool>(false)
    var errorOccurred = Box<String?>(nil)
    var searchQueryList : [SchoolAPIModel] = []
    
    private var dataStore : SchoolDataStore = SchoolAPIDataStore()
    
    public init( dataStore : SchoolDataStore = SchoolAPIDataStore()) {
    
        super.init()
        self.dataStore = dataStore
    }
    
    func fetchTestData() {
        
            let request = SchoolRequestModel(limit: 20, offset: 0)
            dataStore.getSchoolList(request: request) {[weak self] (result) in
                
                guard let selfStrong = self else {
                    
                    return
                }
                
                switch result {
                    
                    case .success(let data):
                        self?.searchQueryList += data
                        self?.isDataLoaded.value = true
                        
                    print("Success")
                    
                    
                    case .failure(let error):
                        selfStrong.errorOccurred.value = error.description
                }
            }
    }
    
    func fetchSchools(with limit:Int) {
        
        let request = SchoolRequestModel(limit: limit, offset: 0)
        dataStore.getSchoolList(request: request) {[weak self] (result) in
            
            guard let selfStrong = self else {
                
                return
            }
            
            switch result {
                
            case .success(let data):
                self?.searchQueryList += data
                self?.isDataLoaded.value = true
                
                print("Success")
                
                
            case .failure(let error):
                selfStrong.errorOccurred.value = error.description
            }
        }
        
    }
}
