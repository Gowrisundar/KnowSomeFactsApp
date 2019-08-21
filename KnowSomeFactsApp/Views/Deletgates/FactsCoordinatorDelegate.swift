//
//  FactsCoordinatorDelegate.swift
//  KnowSomeFactsApp
//
//  Created by fordlabs on 19/08/19.
//  Copyright © 2019 fordlabs. All rights reserved.
//

import Foundation


protocol FactsCoordinatorDelegate: class {
    
    func submitButtonIsTapped(data: FactsModel)
    
}
