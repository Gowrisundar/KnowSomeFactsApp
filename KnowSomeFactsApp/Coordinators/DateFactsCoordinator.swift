//
//  DateFactsCoordinator.swift
//  KnowSomeFactsApp
//
//  Created by fordlabs on 19/08/19.
//  Copyright © 2019 fordlabs. All rights reserved.
//

import Foundation
import UIKit

class DateFactsCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    var dateFactsViewController: DateFactsViewController!
    
    func start() {
        
        dateFactsViewController.delegate = self
        self.navigationController.pushViewController(dateFactsViewController, animated: true)
        
    }
    
    init(navigationController: UINavigationController) {
        
        self.dateFactsViewController = DateFactsViewController(viewModel: FactsViewModel(apiClient: KnowSomeFactsRapidAPI()))
        self.navigationController = navigationController
        
    }
    
}

extension DateFactsCoordinator: FactsCoordinatorDelegate {
    
    func submitButtonIsTapped(data: FactsModel) {
        self.navigationController.pushViewController(DetailedKnowSomeFactsViewController(data: data), animated: true)
    }
    
}
