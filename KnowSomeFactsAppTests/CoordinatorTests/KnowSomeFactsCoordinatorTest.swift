//
//  KnowSomeFactsCoordinatorTest.swift
//  KnowSomeFactsAppTests
//
//  Created by fordlabs on 19/08/19.
//  Copyright © 2019 fordlabs. All rights reserved.
//

import XCTest

import UIKit

@testable import KnowSomeFactsApp


class KnowSomeFactsCoordinatorTest: XCTestCase {
    
    
    
    var knowSomeFactsViewController: KnowSomeFactsViewController!
    var mockNavigationController: MockNavigationController!
    var knowSomeFactsCoordinator: KnowSomeFactsCoordinator!
    
    override func setUp() {
        knowSomeFactsViewController = KnowSomeFactsViewController()
        mockNavigationController = MockNavigationController()
        knowSomeFactsCoordinator = KnowSomeFactsCoordinator(navigationController: mockNavigationController)
    }
    
    
    func test_GivenKnowSomeFactsCoordinator_WhenKnowSomeFactsCoordinatorStartMethodIsCalled_ThenKnowSomeFactsViewControllerShouldBeLoaded() {
        
        knowSomeFactsCoordinator.start()
        XCTAssert(self.mockNavigationController.topViewController?.isKind(of: KnowSomeFactsViewController.self) ?? false)
        
    }
    
}
