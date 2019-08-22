//
//  MockFactsViewModel.swift
//  KnowSomeFactsAppTests
//
//  Created by fordlabs on 21/08/19.
//  Copyright © 2019 fordlabs. All rights reserved.
//

import Foundation

@testable import KnowSomeFactsApp

class MockFactsViewModel : FactsViewModel {
    
    var getDateFactsMethodCalled = false
    
    var getYearFactsMethodCalled = false
    
    var getMathFactsMethodCalled = false
    
    var viewModelCompletionHandler: ((FactsModel?, Error?) -> Void)!
    
    override func getDateFacts(date: String, month: String, completionHandler: @escaping (FactsModel?, Error?) -> Void) {

        getDateFactsMethodCalled = true
        viewModelCompletionHandler = completionHandler
        
    }
    
    override func getYearFacts(year: String, completionHandler: @escaping (FactsModel?, Error?) -> Void) {
        getYearFactsMethodCalled = true
        viewModelCompletionHandler = completionHandler
    }
    
    override func getMathFacts(math: String, completionHandler: @escaping (FactsModel?, Error?) -> Void) {
        getMathFactsMethodCalled = true
        viewModelCompletionHandler = completionHandler
    }
    
}
