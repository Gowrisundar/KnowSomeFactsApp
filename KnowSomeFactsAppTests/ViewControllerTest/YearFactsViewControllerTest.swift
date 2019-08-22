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
    var mockFactsViewModel: MockFactsViewModel!
    
    override func setUp() {
        mockFactsViewModel = MockFactsViewModel()
        yearFactsViewController = YearFactsViewController(viewModel: mockFactsViewModel)
        mockFactsCoordinator = MockFactsCoordinator()
        yearFactsViewController.delegate = mockFactsCoordinator
    }
    
    
    func test_GivenYearFactsViewController_WhenDateFactsViewControllerIsLoaded_ThenTwoLabelOneTextFieldOneButtonShouldBeDisplayed() {
        
        XCTAssertNotNil(KnowSomeFactsAppUtil.findSubViewsInView(view: yearFactsViewController.view, identifier: "yearLabel"))
        XCTAssertNotNil(KnowSomeFactsAppUtil.findSubViewsInView(view: yearFactsViewController.view, identifier: "yearTextField"))
        XCTAssertNotNil(KnowSomeFactsAppUtil.findSubViewsInView(view: yearFactsViewController.view, identifier: "errorLabel"))
        XCTAssertNotNil(KnowSomeFactsAppUtil.findSubViewsInView(view: yearFactsViewController.view, identifier: "submitBtn"))
        
    }
    
    func test_GivenYearFactsViewController_WhenSubmitButtonIsTapped_ThenViewModelGetYearFactsMethodShouldBeCalled() {
        let submitBtnIsTapped = KnowSomeFactsAppUtil.findSubViewsInView(view: yearFactsViewController.view, identifier: "submitBtn") as? UIButton
        submitBtnIsTapped?.sendActions(for: .touchUpInside)
        XCTAssertTrue(mockFactsViewModel.getYearFactsMethodCalled)
    }
    
    func test_GivenYearFactsViewControllerSubmitButtonIsTapped_WhenFactsViewModelIsCalled_ThenCoordinatorSubmitButtonIsTappedMethodToBeCalledInsideClosure() {
        let expectation = self.expectation(description: "Submit button tap action called")
        let submitBtnIsTapped = KnowSomeFactsAppUtil.findSubViewsInView(view: yearFactsViewController.view, identifier: "submitBtn") as? UIButton
        submitBtnIsTapped?.sendActions(for: .touchUpInside)
        mockFactsCoordinator.submitButtonExpectation = expectation
        let factsModel = FactsModel(text: "", number: 0, found: true, type: "", date: "", year: 0)
        mockFactsViewModel.viewModelCompletionHandler(factsModel,nil)
        waitForExpectations(timeout: 0.01) { (error) in
            XCTAssertNil(error)
        }
        XCTAssertTrue(mockFactsCoordinator.isSubmitButtonTapped)
        
    }
    
    func test_GivenYearFactsViewControllerSubmitButtonIsTapped_WhenCoordinatorSubmitButtonIsTappedMethodCalled_ThenCoordinatorSubmitButtonIsTappedMethodArugumentShouldHaveDataPassed(){
        
        let expectation = self.expectation(description: "Submit button tap action called")
        let submitBtnIsTapped = KnowSomeFactsAppUtil.findSubViewsInView(view: yearFactsViewController.view, identifier: "submitBtn") as? UIButton
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
