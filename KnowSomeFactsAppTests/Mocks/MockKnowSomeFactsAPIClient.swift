//
//  MockKnowSomeFactsAPIClient.swift
//  KnowSomeFactsAppTests
//
//  Created by fordlabs on 20/08/19.
//  Copyright © 2019 fordlabs. All rights reserved.
//

import Foundation

import UIKit

@testable import KnowSomeFactsApp

class MockKnowSomeFactsAPIClient: KnowSomeFactsRapidAPI{
    
    var factModel: FactsModel!
    var date = ""
    var month = ""
    var year = ""
    var number = ""
    
    override func getDateFacts(date: String, month: String, completionHandler: @escaping (FactsModel?, Error?) -> Void) {
        self.date = date
        self.month = month
        completionHandler(factModel, nil)
    }
    
    override func getYearFacts(year: String, completionHandler: @escaping (FactsModel?, Error?) -> Void) {
        self.year = year
        completionHandler(factModel, nil)
    }
    
    override func getMathFacts(math: String, completionHandler: @escaping (FactsModel?, Error?) -> Void) {
        self.number = math
        completionHandler(factModel, nil)
    }
    
    
}
