//
//  AssignmentTests.swift
//  AssignmentTests
//
//  Created by Umair Ali on 9/18/18.
//  Copyright © 2018 Umair Ali. All rights reserved.
//

import XCTest
@testable import Assignment

class AssignmentTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSearchQuery_ShouldShowErrorOnNetworkIssue() {
        
        let schoolDataStore = ErrorResultStubSchoolDataStore()
        let viewModel = ListingViewModel(dataStore: schoolDataStore)
        
        
        
        // 1. Define an expectation
        
        let expect = expectation(description: "Result successfully fetectched")
        
        
        
        viewModel.errorOccurred.bind { (value) in
            
            XCTAssertTrue(true)
            
            
            // Don't forget to fulfill the expectation in the async callback
            expect.fulfill()
        }
        
        // some limit witch do not have result
        
        viewModel.fetchSchools(with: -1)
        
        // 3. Wait for the expectation to be fulfilled
        waitForExpectations(timeout: 1) { error in
            
            if let error = error {
                XCTFail("waitForExpectationsWithTimeout errored: \(error)")
            }
            
            
        }
        
        
    }
    
}
