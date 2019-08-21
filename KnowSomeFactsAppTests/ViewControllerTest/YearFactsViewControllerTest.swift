//
//  YearFactsViewControllerTest.swift
//  KnowSomeFactsAppTests
//
//  Created by fordlabs on 19/08/19.
//  Copyright © 2019 fordlabs. All rights reserved.
//

import Foundation
import XCTest

@testable import KnowSomeFactsApp

class YearFactsViewControllerTest: XCTestCase {
    
    var yearFactsViewController: YearFactsViewController!
    var mockFactsCoordinator: MockFactsCoordinator!
    
    override func setUp() {
        yearFactsViewController = YearFactsViewController()
        mockFactsCoordinator = MockFactsCoordinator()
        yearFactsViewController.delegate = mockFactsCoordinator
    }
    
    
    func test_GivenDateFactsViewController_WhenDateFactsViewControllerIsLoaded_ThenTwoLabelOneTextFieldOneButtonShouldBeDisplayed() {
        
        XCTAssertNotNil(KnowSomeFactsAppUtil.findSubViewsInView(view: yearFactsViewController.view, identifier: "yearLabel"))
        XCTAssertNotNil(KnowSomeFactsAppUtil.findSubViewsInView(view: yearFactsViewController.view, identifier: "yearTextField"))
        XCTAssertNotNil(KnowSomeFactsAppUtil.findSubViewsInView(view: yearFactsViewController.view, identifier: "errorLabel"))
        XCTAssertNotNil(KnowSomeFactsAppUtil.findSubViewsInView(view: yearFactsViewController.view, identifier: "submitBtn"))
        
    }
    
    func test_GivenDateFactsViewController_WhenSubmitButtonIsTapped_ThenSubmitButtonIsTappedMethodToBeCalled() {
        
        let submitBtnIsTapped = KnowSomeFactsAppUtil.findSubViewsInView(view: yearFactsViewController.view, identifier: "submitBtn") as? UIButton
        submitBtnIsTapped?.sendActions(for: .touchUpInside)
        XCTAssertTrue(mockFactsCoordinator.isSubmitButtonTapped)
        
    }
    
    
}
