//
//  DateFactsCoordinatorTest.swift
//  KnowSomeFactsAppTests
//
//  Created by fordlabs on 19/08/19.
//  Copyright © 2019 fordlabs. All rights reserved.
//

import Foundation
import UIKit
import XCTest

@testable import KnowSomeFactsApp


class DateFactsCoordinatorTest: XCTestCase {
    
    var mockNavigationController: MockNavigationController!
    var dateFactsCoordinator: DateFactsCoordinator!
    
    override func setUp() {
        mockNavigationController = MockNavigationController()
        dateFactsCoordinator = DateFactsCoordinator(navigationController: mockNavigationController)
    }
    
    
    func test_GivenDateFactsCoordinator_WhenDateCoordinatorStartMethodIsCalled_ThenDateFactsViewControllerShouldBeLoaded() {
        
        dateFactsCoordinator.start()
        XCTAssert(self.mockNavigationController.topViewController?.isKind(of: DateFactsViewController.self) ?? false)
    }
    
}
