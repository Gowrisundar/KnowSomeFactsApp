//
//  FactsModel.swift
//  KnowSomeFactsApp
//
//  Created by fordlabs on 19/08/19.
//  Copyright © 2019 fordlabs. All rights reserved.
//

import Foundation

struct FactsModel : Codable {
    
    let text: String
    let number: Int
    let found: Bool
    let type: String
    let date: String?
    let year: Int?
    
}
