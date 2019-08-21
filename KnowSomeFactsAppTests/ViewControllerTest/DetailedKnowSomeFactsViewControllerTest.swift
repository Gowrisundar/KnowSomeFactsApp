//
//  DetailedKnowSomeFactsViewControllerTest.swift
//  KnowSomeFactsAppTests
//
//  Created by fordlabs on 21/08/19.
//  Copyright © 2019 fordlabs. All rights reserved.
//

import Foundation
import XCTest

@testable import KnowSomeFactsApp

class DetailedKnowSomeFactsViewControllerTest: XCTestCase {
    
    var detailedKnowSomeFactsViewController: DetailedKnowSomeFactsViewController!
    var factsModel: FactsModel!
    
    override func setUp() {
        factsModel = FactsModel(text: "Sundar", number: 1, found: true, type: "test", date: "8", year: 8)
        detailedKnowSomeFactsViewController = DetailedKnowSomeFactsViewController(data: factsModel)
    }
    
    
    func test_GivenDetailedKnowSomeFactsViewController_WhenDetailedKnowSomeFactsViewControllerIsLoaded_TableViewShouldBeDisplayed() {
        
        let tableView = KnowSomeFactsAppUtil.findSubViewsInView(view: detailedKnowSomeFactsViewController.view, identifier: "factsTableView")
        XCTAssertNotNil(tableView)
        
    }
    
    func test_GivenDetailedKnowSomeFactsViewController_WhenDetailedKnowSomeFactsViewControllerIsLoaded_TableViewShouldHaveDelegateAndDatasource() {
        
        let tableView = KnowSomeFactsAppUtil.findSubViewsInView(view: detailedKnowSomeFactsViewController.view, identifier: "factsTableView") as! UITableView
        XCTAssertNotNil(tableView.delegate)
        XCTAssertNotNil(tableView.dataSource)
        
    }
    
    func test_GivenDetailedKnowSomeFactsViewController_WhenDetailedKnowSomeFactsViewControllerIsLoaded_TableViewShouldHaveACellWithReuseIdentifier() {
        let tableView = KnowSomeFactsAppUtil.findSubViewsInView(view: detailedKnowSomeFactsViewController.view, identifier: "factsTableView") as! UITableView
        let cell = detailedKnowSomeFactsViewController.tableView(tableView, cellForRowAt: IndexPath(row: 0, section: 0)) as! FactsTableViewCell
        let actualReuseIdentifer = cell.reuseIdentifier
        let expectedReuseIdentifier = "FactsCellIdentifier"
        XCTAssertEqual(actualReuseIdentifer, expectedReuseIdentifier)
    }
    
    func test_GivenDetailedKnowSomeFactsViewController_WhenTableViewIsLoaded_TableViewCellShouldHaveTwoLabel() {
        let tableView = KnowSomeFactsAppUtil.findSubViewsInView(view: detailedKnowSomeFactsViewController.view, identifier: "factsTableView") as! UITableView
        let cell = detailedKnowSomeFactsViewController.tableView(tableView, cellForRowAt: IndexPath(row: 0, section: 0)) as! FactsTableViewCell
        
        let basicLabel = KnowSomeFactsAppUtil.findSubViewsInView(view: cell, identifier: "basicInfoLabel")
        let correspondingValueLabel = KnowSomeFactsAppUtil.findSubViewsInView(view: cell, identifier: "correspondingValueLabel")
        
        XCTAssertNotNil(basicLabel)
        XCTAssertNotNil(correspondingValueLabel)
    }
    
    func test_GivenDetailedKnowSomeFactsViewController_WhenTableViewCellIsLoaded_TableViewCellLabelShouldHaveData() {
        let tableView = KnowSomeFactsAppUtil.findSubViewsInView(view: detailedKnowSomeFactsViewController.view, identifier: "factsTableView") as! UITableView
        let cell = detailedKnowSomeFactsViewController.tableView(tableView, cellForRowAt: IndexPath(row: 0, section: 0)) as! FactsTableViewCell
        
        let basicLabel = KnowSomeFactsAppUtil.findSubViewsInView(view: cell, identifier: "basicInfoLabel") as! UILabel
        let correspondingValueLabel = KnowSomeFactsAppUtil.findSubViewsInView(view: cell, identifier: "correspondingValueLabel") as! UILabel
        
        let actualBasicLabelValue = basicLabel.text
        let expectedBasicLabelValue = "Text"
        
        let actualCorrespondingLabelValue = correspondingValueLabel.text
        let expectedCorrespondingLabelValue = "Sundar"
        
        XCTAssertEqual(actualBasicLabelValue, expectedBasicLabelValue)
        XCTAssertEqual(actualCorrespondingLabelValue, expectedCorrespondingLabelValue)
        
    }
    
    
    
}
