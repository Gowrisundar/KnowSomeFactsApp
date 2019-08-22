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
        mockFactsViewModel = MockFactsViewModel()
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
    
    
    func test_GivenDateFactsViewController_WhenSubmitButtonIsTapped_ThenViewModelGetDateFactsMethodShouldBeCalled() {
        let submitBtnIsTapped = KnowSomeFactsAppUtil.findSubViewsInView(view: dateFactsViewController.view, identifier: "submitBtn") as? UIButton
        submitBtnIsTapped?.sendActions(for: .touchUpInside)
        XCTAssertTrue(mockFactsViewModel.getDateFactsMethodCalled)
    }
    
    func test_GivenDateFactsViewControllerSubmitButtonIsTapped_WhenFactsViewModelIsCalled_ThenCoordinatorSubmitButtonIsTappedMethodToBeCalledInsideClosure() {
        let expectation = self.expectation(description: "Submit button tap action called")
        let submitBtnIsTapped = KnowSomeFactsAppUtil.findSubViewsInView(view: dateFactsViewController.view, identifier: "submitBtn") as? UIButton
        mockFactsCoordinator.submitButtonExpectation = expectation
        submitBtnIsTapped?.sendActions(for: .touchUpInside)
        let factsModel = FactsModel(text: "", number: 0, found: true, type: "", date: "", year: 0)
        mockFactsViewModel.viewModelCompletionHandler(factsModel,nil)
        waitForExpectations(timeout: 0.01) { (error) in
            XCTAssertNil(error)
        }
        XCTAssertTrue(mockFactsCoordinator.isSubmitButtonTapped)
    }
    
    func test_GivenDateFactsViewControllerSubmitButtonIsTapped_WhenCoordinatorSubmitButtonIsTappedMethodCalled_ThenCoordinatorSubmitButtonIsTappedMethodArugumentShouldHaveDataPassed(){
        
        let expectation = self.expectation(description: "Submit button tap action called")
        let submitBtnIsTapped = KnowSomeFactsAppUtil.findSubViewsInView(view: dateFactsViewController.view, identifier: "submitBtn") as? UIButton
        mockFactsCoordinator.submitButtonExpectation = expectation
        submitBtnIsTapped?.sendActions(for: .touchUpInside)
        let factsModel = FactsModel(text: "", number: 0, found: true, type: "", date: "22-Aug-2019", year: 0)
        mockFactsViewModel.viewModelCompletionHandler(factsModel,nil)
        waitForExpectations(timeout: 0.01) { (error) in
            XCTAssertNil(error)
        }
        XCTAssertEqual("22-Aug-2019", mockFactsCoordinator.date)
    }
    

}
