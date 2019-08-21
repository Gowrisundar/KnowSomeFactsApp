//
//  MockUIButton.swift
//  KnowSomeFactsAppTests
//
//  Created by fordlabs on 21/08/19.
//  Copyright © 2019 fordlabs. All rights reserved.
//

import Foundation

import UIKit

@testable import KnowSomeFactsApp

class MockUIButton: UIButton {
    
    override func addTarget(_ target: Any?, action: Selector, for controlEvents: UIControl.Event) {
        super.addTarget(target, action: #selector(submitButtonTapped), for: controlEvents)
    }
    
    override func sendActions(for controlEvents: UIControl.Event) {
        super.sendActions(for: controlEvents)
    }
    
    @objc func submitButtonTapped(_ target: Any?){
        
        let dateViewController = target as! DateFactsViewController
        dateViewController.delegate.submitButtonIsTapped(data: FactsModel(text: "", number: 0, found: true, type: "", date: "", year: 0))
    }
    
}
