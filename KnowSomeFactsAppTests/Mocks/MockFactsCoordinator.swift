//
//  MockDateFactsCoordinator.swift
//  KnowSomeFactsAppTests
//
//  Created by fordlabs on 19/08/19.
//  Copyright © 2019 fordlabs. All rights reserved.
//

import Foundation
import UIKit

@testable import KnowSomeFactsApp

class MockFactsCoordinator: FactsCoordinatorDelegate {
    
    var isSubmitButtonTapped = false
    
    func submitButtonIsTapped(data: FactsModel) {
        isSubmitButtonTapped = true
    }
    
}
