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
    var mockFactsViewModel: MockFactsViewModel!
    
    override func setUp() {
        mockFactsViewModel = MockFactsViewModel()
        mathFactsViewController = MathFactsViewController(viewModel: mockFactsViewModel)
        mockFactsCoordinator = MockFactsCoordinator()
        mathFactsViewController.delegate = mockFactsCoordinator
    }
    
    
    func test_GivenDateFactsViewController_WhenDateFactsViewControllerIsLoaded_ThenTwoLabelOneTextFieldOneButtonShouldBeDisplayed() {
        
        XCTAssertNotNil(KnowSomeFactsAppUtil.findSubViewsInView(view: mathFactsViewController.view, identifier: "mathLabel"))
        XCTAssertNotNil(KnowSomeFactsAppUtil.findSubViewsInView(view: mathFactsViewController.view, identifier: "mathTextField"))
        XCTAssertNotNil(KnowSomeFactsAppUtil.findSubViewsInView(view: mathFactsViewController.view, identifier: "errorLabel"))
        XCTAssertNotNil(KnowSomeFactsAppUtil.findSubViewsInView(view: mathFactsViewController.view, identifier: "submitBtn"))
        
    }
    
    func test_GivenMathFactsViewController_WhenSubmitButtonIsTapped_ThenViewModelGetYearFactsMethodShouldBeCalled() {
        let submitBtnIsTapped = KnowSomeFactsAppUtil.findSubViewsInView(view: mathFactsViewController.view, identifier: "submitBtn") as? UIButton
        submitBtnIsTapped?.sendActions(for: .touchUpInside)
        XCTAssertTrue(mockFactsViewModel.getMathFactsMethodCalled)
    }
    
    func test_GivenMathFactsViewControllerSubmitButtonIsTapped_WhenFactsViewModelIsCalled_ThenCoordinatorSubmitButtonIsTappedMethodToBeCalledInsideClosure() {
        let expectation = self.expectation(description: "Submit button tap action called")
        let submitBtnIsTapped = KnowSomeFactsAppUtil.findSubViewsInView(view: mathFactsViewController.view, identifier: "submitBtn") as? UIButton
        submitBtnIsTapped?.sendActions(for: .touchUpInside)
        mockFactsCoordinator.submitButtonExpectation = expectation
        let factsModel = FactsModel(text: "", number: 0, found: true, type: "", date: "", year: 0)
        mockFactsViewModel.viewModelCompletionHandler(factsModel,nil)
        waitForExpectations(timeout: 0.01) { (error) in
            XCTAssertNil(error)
        }
        XCTAssertTrue(mockFactsCoordinator.isSubmitButtonTapped)
        
    }
    
    func test_GivenMathFactsViewControllerSubmitButtonIsTapped_WhenCoordinatorSubmitButtonIsTappedMethodCalled_ThenCoordinatorSubmitButtonIsTappedMethodArugumentShouldHaveDataPassed(){
        
        let expectation = self.expectation(description: "Submit button tap action called")
        let submitBtnIsTapped = KnowSomeFactsAppUtil.findSubViewsInView(view: mathFactsViewController.view, identifier: "submitBtn") as? UIButton
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
