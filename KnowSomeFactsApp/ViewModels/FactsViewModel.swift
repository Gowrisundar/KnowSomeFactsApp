//
//  FactsViewModel.swift
//  KnowSomeFactsApp
//
//  Created by fordlabs on 20/08/19.
//  Copyright © 2019 fordlabs. All rights reserved.
//

import Foundation

class FactsViewModel {
    
    var apiClient : KnowSomeFactsRapidAPI!
    
    init(apiClient: KnowSomeFactsRapidAPI){
        self.apiClient = apiClient
    }
    
    convenience init(){
        self.init(apiClient: KnowSomeFactsRapidAPI())
    }
    
    func getDateFacts(date: String, month: String, completionHandler: @escaping (FactsModel?, Error?) -> Void){
        apiClient.getDateFacts(date: date, month: month, completionHandler: completionHandler)
    }
    
    func getYearFacts(year: String, completionHandler: @escaping (FactsModel?, Error?) -> Void){
        apiClient.getYearFacts(year: year, completionHandler: completionHandler)
    }
    
    func getMathFacts(math: String, completionHandler: @escaping (FactsModel?, Error?) -> Void){
        apiClient.getMathFacts(math: math, completionHandler: completionHandler)
    }
    
}
