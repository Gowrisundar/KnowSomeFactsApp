//
//  MathFactsCoordinatorTest.swift
//  KnowSomeFactsAppTests
//
//  Created by fordlabs on 19/08/19.
//  Copyright © 2019 fordlabs. All rights reserved.
//

import Foundation
import UIKit
import XCTest

@testable import KnowSomeFactsApp


class MathFactsCoordinatorTest: XCTestCase {
    
    var mockNavigationController: MockNavigationController!
    var mathFactsCoordinator: MathFactsCoordinator!
    
    override func setUp() {
        mockNavigationController = MockNavigationController()
        mathFactsCoordinator = MathFactsCoordinator(navigationController: mockNavigationController)
    }
    
    
    func test_GivenMathFactsCoordinator_WhenMathFactsCoordinatorStartMethodIsCalled_ThenMathFactsViewControllerShouldBeLoaded() {
        mathFactsCoordinator.start()
        XCTAssert(self.mockNavigationController.topViewController?.isKind(of: MathFactsViewController.self) ?? false)
    }
    
}
