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
    
    
    override func getDateFacts(date: String, month: String, completionHandler: @escaping (FactsModel?, Error?) -> Void) {
        
        let factsModel = FactsModel(text: "Sundar", number: 0, found: true, type: "text", date: "8", year: 8)

        completionHandler(factsModel,nil)
        
    }
    
    
    
    
}
