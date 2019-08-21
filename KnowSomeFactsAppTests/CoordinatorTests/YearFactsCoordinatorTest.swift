//
//  YearFactsCoordinatorTest.swift
//  KnowSomeFactsAppTests
//
//  Created by fordlabs on 19/08/19.
//  Copyright © 2019 fordlabs. All rights reserved.
//

import Foundation
import UIKit
import XCTest

@testable import KnowSomeFactsApp


class YearFactsCoordinatorTest: XCTestCase {
    
    var mockNavigationController: MockNavigationController!
    var yearFactsCoordinator: YearFactsCoordinator!
    
    override func setUp() {
        mockNavigationController = MockNavigationController()
        yearFactsCoordinator = YearFactsCoordinator(navigationController: mockNavigationController)
    }
    
    
    func test_GivenYearFactsCoordinator_WhenYearFactsCoordinatorStartMethodIsCalled_ThenYearFactsViewControllerShouldBeLoaded() {
        yearFactsCoordinator.start()
        XCTAssert(self.mockNavigationController.topViewController?.isKind(of: YearFactsViewController.self) ?? false)
    }
    
}
