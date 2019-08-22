//
//  YearFactsCoordinator.swift
//  KnowSomeFactsApp
//
//  Created by fordlabs on 19/08/19.
//  Copyright © 2019 fordlabs. All rights reserved.
//

import Foundation
import UIKit

class YearFactsCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    var yearFactsViewController: YearFactsViewController!
    
    func start() {
        
        yearFactsViewController.delegate = self
        self.navigationController.pushViewController(yearFactsViewController, animated: true)
        
    }
    
    init(navigationController: UINavigationController) {
        
        self.yearFactsViewController = YearFactsViewController(viewModel: FactsViewModel())
        self.navigationController = navigationController
        
    }
    
}

extension YearFactsCoordinator: FactsCoordinatorDelegate {
    
    func submitButtonIsTapped(data: FactsModel) {
        navigationController.pushViewController(DetailedKnowSomeFactsViewController(data:data), animated: true)
    }
    
    
}
