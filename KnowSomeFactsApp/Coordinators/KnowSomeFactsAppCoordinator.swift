//
//  KnowSomeFactsAppCoordinator.swift
//  KnowSomeFactsApp
//
//  Created by fordlabs on 19/08/19.
//  Copyright © 2019 fordlabs. All rights reserved.
//

import Foundation

import UIKit

class KnowSomeFactsCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    var knowSomeFactsViewController: KnowSomeFactsViewController!
    var dateFactsCoordinator: DateFactsCoordinator!
    var yearFactsCoordinator: YearFactsCoordinator!
    var mathFactsCoordinator: MathFactsCoordinator!
    
    func start() {
        
        knowSomeFactsViewController.delegate = self
        self.navigationController.pushViewController(knowSomeFactsViewController, animated: true)
        
    }
    
    init(navigationController: UINavigationController) {
        
        self.knowSomeFactsViewController = KnowSomeFactsViewController()
        self.navigationController = navigationController
        
    }
    
}

extension KnowSomeFactsCoordinator: KnowSomeFactViewControllerDelegate {
    
    func dateFactsBtnIsTapped() {
        dateFactsCoordinator = DateFactsCoordinator(navigationController: navigationController)
        dateFactsCoordinator.start()
        
    }
    
    func yearFactsBtnIsTapped() {
        yearFactsCoordinator = YearFactsCoordinator(navigationController: navigationController)
        yearFactsCoordinator.start()
    }
    
    func mathFactsBtnIsTapped() {
        mathFactsCoordinator = MathFactsCoordinator(navigationController: navigationController)
        mathFactsCoordinator.start()
    }
    
}
