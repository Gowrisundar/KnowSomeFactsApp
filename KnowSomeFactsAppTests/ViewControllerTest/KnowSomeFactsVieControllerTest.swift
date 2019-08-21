//
//  KnowSomeFactsVieWControllerTest.swift
//  KnowSomeFactsAppTests
//
//  Created by fordlabs on 19/08/19.
//  Copyright © 2019 fordlabs. All rights reserved.
//

import XCTest

@testable import KnowSomeFactsApp

class KnowSomeFactsViewControllerTest: XCTestCase {
    
    var knowSomeFactsViewController: KnowSomeFactsViewController!
    var mockKnowSomeFactsCoordinator: MockKnowSomeFactsCoordinator!

    override func setUp() {
        knowSomeFactsViewController = KnowSomeFactsViewController()
        mockKnowSomeFactsCoordinator = MockKnowSomeFactsCoordinator()
        knowSomeFactsViewController.delegate = mockKnowSomeFactsCoordinator
    }


    func test_GivenKnowSomeFactsViewController_WhenKnowSomeFactsViewControllerIsLoaded_TwoLabels3ButtonsShouldBeDisplayed() {
        
        XCTAssertNotNil(KnowSomeFactsAppUtil.findSubViewsInView(view: knowSomeFactsViewController.view, identifier: "titleLabel"))
        XCTAssertNotNil(KnowSomeFactsAppUtil.findSubViewsInView(view: knowSomeFactsViewController.view, identifier: "informationLabel"))
        XCTAssertNotNil(KnowSomeFactsAppUtil.findSubViewsInView(view: knowSomeFactsViewController.view, identifier: "buttonStackView"))
        XCTAssertNotNil(KnowSomeFactsAppUtil.findviewsInStackView(view: knowSomeFactsViewController.view, stackViewIdentifier: "buttonStackView", identifier: "dateFactsBtn"))
        XCTAssertNotNil(KnowSomeFactsAppUtil.findviewsInStackView(view: knowSomeFactsViewController.view, stackViewIdentifier: "buttonStackView", identifier: "yearFactsBtn"))
        XCTAssertNotNil(KnowSomeFactsAppUtil.findviewsInStackView(view: knowSomeFactsViewController.view, stackViewIdentifier: "buttonStackView", identifier: "mathFactsBtn"))
        
        
    }
    
    func test_GivenKnowSomeFactsViewController_whenDateFactButtonIsTapped_ThenDateFactsBtnIsTappedMethodToBeCalled() {
        
        let dateFactsBtnIsTapped = KnowSomeFactsAppUtil.findviewsInStackView(view: knowSomeFactsViewController.view, stackViewIdentifier: "buttonStackView", identifier: "dateFactsBtn") as? UIButton
        dateFactsBtnIsTapped?.sendActions(for: .touchUpInside)
        XCTAssertTrue(mockKnowSomeFactsCoordinator.dateButtonTapped)
        
    }
    
    func test_GivenKnowSomeFactsViewController_whenYearFactButtonIsTapped_ThenYearFactsBtnIsTappedMethodToBeCalled() {
        
        let yearFactsBtnIsTapped = KnowSomeFactsAppUtil.findviewsInStackView(view: knowSomeFactsViewController.view, stackViewIdentifier: "buttonStackView", identifier: "yearFactsBtn") as? UIButton
        yearFactsBtnIsTapped?.sendActions(for: .touchUpInside)
        XCTAssertTrue(mockKnowSomeFactsCoordinator.yearButtonTapped)
        
    }
    
    func test_GivenKnowSomeFactsViewController_whenMathFactButtonIsTapped_ThenMathFactsBtnIsTappedMethodToBeCalled() {
        
        let mathFactsBtnIsTapped = KnowSomeFactsAppUtil.findviewsInStackView(view: knowSomeFactsViewController.view, stackViewIdentifier: "buttonStackView", identifier: "mathFactsBtn") as? UIButton
        mathFactsBtnIsTapped?.sendActions(for: .touchUpInside)
        XCTAssertTrue(mockKnowSomeFactsCoordinator.mathButtonTapped)
    }

}
