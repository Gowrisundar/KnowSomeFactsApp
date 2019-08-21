//
//  DateFactsViewControllerTest.swift
//  KnowSomeFactsAppTests
//
//  Created by fordlabs on 19/08/19.
//  Copyright © 2019 fordlabs. All rights reserved.
//

import XCTest

@testable import KnowSomeFactsApp
class DateFactsViewControllerTest: XCTestCase {

    var dateFactsViewController: DateFactsViewController!
    var mockFactsCoordinator: MockFactsCoordinator!
    var mockFactsViewModel: MockFactsViewModel!
    
    override func setUp() {
        mockFactsViewModel = MockFactsViewModel(apiClient: MockKnowSomeFactsAPIClient())
        mockFactsCoordinator = MockFactsCoordinator()
        dateFactsViewController = DateFactsViewController(viewModel: mockFactsViewModel)
        dateFactsViewController.delegate = mockFactsCoordinator
    }


    func test_GivenDateFactsViewController_WhenDateFactsViewControllerIsLoaded_ThenThreeLabelTwoTextField_OneButtonShouldBeDisplayed() {
        
        XCTAssertNotNil(KnowSomeFactsAppUtil.findSubViewsInView(view: dateFactsViewController.view, identifier: "dateLabel"))
        XCTAssertNotNil(KnowSomeFactsAppUtil.findSubViewsInView(view: dateFactsViewController.view, identifier: "monthLabel"))
        XCTAssertNotNil(KnowSomeFactsAppUtil.findSubViewsInView(view: dateFactsViewController.view, identifier: "errorLabel"))
        XCTAssertNotNil(KnowSomeFactsAppUtil.findSubViewsInView(view: dateFactsViewController.view, identifier: "dateTextField"))
        XCTAssertNotNil(KnowSomeFactsAppUtil.findSubViewsInView(view: dateFactsViewController.view, identifier: "monthTextField"))
        XCTAssertNotNil(KnowSomeFactsAppUtil.findSubViewsInView(view: dateFactsViewController.view, identifier: "submitBtn"))

    }
    
    func test_GivenDateFactsViewController_WhenSubmitButtonIsTapped_ThenSubmitButtonIsTappedMethodToBeCalled() {
        
        let submitBtnIsTapped = KnowSomeFactsAppUtil.findSubViewsInView(view: dateFactsViewController.view, identifier: "submitBtn") as? UIButton
        submitBtnIsTapped?.sendActions(for: .touchUpInside)
        XCTAssertTrue(mockFactsCoordinator.isSubmitButtonTapped)
    }
    

}
