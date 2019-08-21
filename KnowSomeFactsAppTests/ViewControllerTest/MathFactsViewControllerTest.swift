//
//  MathFactsViewController.swift
//  KnowSomeFactsAppTests
//
//  Created by fordlabs on 19/08/19.
//  Copyright © 2019 fordlabs. All rights reserved.
//

import Foundation
import XCTest

@testable import KnowSomeFactsApp

class MathFactsViewControllerTest: XCTestCase {
    
    var mathFactsViewController: MathFactsViewController!
    var mockFactsCoordinator: MockFactsCoordinator!
    
    override func setUp() {
        mathFactsViewController = MathFactsViewController()
        mockFactsCoordinator = MockFactsCoordinator()
        mathFactsViewController.delegate = mockFactsCoordinator
    }
    
    
    func test_GivenDateFactsViewController_WhenDateFactsViewControllerIsLoaded_ThenTwoLabelOneTextFieldOneButtonShouldBeDisplayed() {
        
        XCTAssertNotNil(KnowSomeFactsAppUtil.findSubViewsInView(view: mathFactsViewController.view, identifier: "mathLabel"))
        XCTAssertNotNil(KnowSomeFactsAppUtil.findSubViewsInView(view: mathFactsViewController.view, identifier: "mathTextField"))
        XCTAssertNotNil(KnowSomeFactsAppUtil.findSubViewsInView(view: mathFactsViewController.view, identifier: "errorLabel"))
        XCTAssertNotNil(KnowSomeFactsAppUtil.findSubViewsInView(view: mathFactsViewController.view, identifier: "submitBtn"))
        
    }
    
    func test_GivenDateFactsViewController_WhenSubmitButtonIsTapped_ThenSubmitButtonIsTappedMethodToBeCalled() {
        
        let submitBtnIsTapped = KnowSomeFactsAppUtil.findSubViewsInView(view: mathFactsViewController.view, identifier: "submitBtn") as? UIButton
        submitBtnIsTapped?.sendActions(for: .touchUpInside)
        let expectation = self.expectation(description: "submitButtonTest")
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertTrue(mockFactsCoordinator.isSubmitButtonTapped)
        
    }
    
    
}
