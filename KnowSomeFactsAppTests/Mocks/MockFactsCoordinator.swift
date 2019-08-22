//
//  MockDateFactsCoordinator.swift
//  KnowSomeFactsAppTests
//
//  Created by fordlabs on 19/08/19.
//  Copyright © 2019 fordlabs. All rights reserved.
//

import Foundation
import UIKit
import XCTest

@testable import KnowSomeFactsApp

class MockFactsCoordinator: FactsCoordinatorDelegate {
    
    var date: String!
    
    var isSubmitButtonTapped = false
    var submitButtonExpectation: XCTestExpectation?
    
    func submitButtonIsTapped(data: FactsModel) {
        isSubmitButtonTapped = true
        date = data.date
        submitButtonExpectation?.fulfill()
    }
    
}
