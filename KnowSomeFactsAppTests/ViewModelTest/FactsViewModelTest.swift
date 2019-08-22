//
//  FactsViewModelTest.swift
//  KnowSomeFactsAppTests
//
//  Created by fordlabs on 20/08/19.
//  Copyright © 2019 fordlabs. All rights reserved.
//

import XCTest
import UIKit

@testable import KnowSomeFactsApp

class FactsViewModelTest: XCTestCase {
    
    var mockAPIClient: MockKnowSomeFactsAPIClient!
    var factsViewModel: FactsViewModel!
    
    
    override func setUp() {
        mockAPIClient = MockKnowSomeFactsAPIClient()
        factsViewModel = FactsViewModel(apiClient: mockAPIClient)
        mockAPIClient.factModel = FactsModel(text: "", number: 0, found: true, type: "", date: "0", year: 0)
    }
    
    
    
    func test_GivenViewModel_WhenGetDateFactsMethodIsCalled_ThenDateFactsAPIMethodShouldBeCalledAndCompletionHandlerShouldBeReturned() {
        
        var date = ""
        
        var month = ""
        
        var found = false
        
        let expectation = self.expectation(description: "DateFactsAPICall")
        
        factsViewModel.getDateFacts(date: "8" , month: "8") { (result, error) in
            date = self.mockAPIClient.date
            month = self.mockAPIClient.month
            found = result!.found
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
        
        XCTAssertEqual(date, "8")
        XCTAssertEqual(month, "8")
        XCTAssertTrue(found)
        
    }
    
    func test_GivenViewModel_WhenGetYearFactsMethodIsCalled_ThenYearFactsAPIMethodShouldBeCalledAndCompletionHandlerShouldBeReturned() {
        
        var year = ""
        
        var found = false
        
        let expectation = self.expectation(description: "DateFactsAPICall")
        
        factsViewModel.getYearFacts(year: "8") { (result, error) in
            year = self.mockAPIClient.year
            found = result!.found
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    
        XCTAssertEqual(year, "8")
        XCTAssertTrue(found)
        
    }
    
    func test_GivenViewModel_WhenGetMathFactsMethodIsCalled_ThenMathFactsAPIMethodShouldBeCalledAndCompletionHandlerShouldBeReturned() {
        
        var math = ""
        
        var found = false
        
        let expectation = self.expectation(description: "DateFactsAPICall")
        
        factsViewModel.getMathFacts(math: "8") { (result, error) in
            math = self.mockAPIClient.number
            found = result!.found
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
        
        XCTAssertEqual(math, "8")
        XCTAssertTrue(found)
        
    }
    
}
