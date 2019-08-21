//
//  Coordinator.swift
//  KnowSomeFactsApp
//
//  Created by fordlabs on 19/08/19.
//  Copyright © 2019 fordlabs. All rights reserved.
//

import Foundation
import UIKit

protocol Coordinator {
    
    var navigationController: UINavigationController { get }
    
    func start()
}
