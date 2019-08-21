//
//  MockKnowSomeFactsCoordinator.swift
//  KnowSomeFactsAppTests
//
//  Created by fordlabs on 19/08/19.
//  Copyright © 2019 fordlabs. All rights reserved.
//

import Foundation

import UIKit

@testable import KnowSomeFactsApp

class MockKnowSomeFactsCoordinator: KnowSomeFactViewControllerDelegate {
    
    var dateButtonTapped = false
    var yearButtonTapped = false
    var mathButtonTapped = false
    
    func dateFactsBtnIsTapped() {
     dateButtonTapped = true
    }
    
    func yearFactsBtnIsTapped() {
     yearButtonTapped = true
    }
    
    func mathFactsBtnIsTapped() {
      mathButtonTapped = true
    }
    
    
    
    
}
