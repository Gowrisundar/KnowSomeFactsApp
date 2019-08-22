//
//  MathFactCoordinator.swift
//  KnowSomeFactsApp
//
//  Created by fordlabs on 19/08/19.
//  Copyright © 2019 fordlabs. All rights reserved.
//

import Foundation
import UIKit

class MathFactsCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    var mathFactsViewController: MathFactsViewController!
    
    func start() {
        
        mathFactsViewController.delegate = self
        self.navigationController.pushViewController(mathFactsViewController, animated: true)
        
    }
    
    init(navigationController: UINavigationController) {
        
        self.mathFactsViewController = MathFactsViewController(viewModel: FactsViewModel())
        self.navigationController = navigationController
        
    }
    
}

extension MathFactsCoordinator: FactsCoordinatorDelegate {
    
    func submitButtonIsTapped(data: FactsModel) {
        navigationController.pushViewController(DetailedKnowSomeFactsViewController(data: data), animated: true)
    }
    
    
}
