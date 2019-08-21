//
//  KnowSomeFactsAppUtil.swift
//  KnowSomeFactsAppTests
//
//  Created by fordlabs on 19/08/19.
//  Copyright © 2019 fordlabs. All rights reserved.
//

import Foundation

import UIKit

class KnowSomeFactsAppUtil{
    
    static func findSubViewsInView(view: UIView, identifier: String) -> UIView? {
        
        for subView in view.subviews {
            
            if(subView.accessibilityIdentifier == identifier) {
                
                return subView
                
            }
            
        }
        
        return nil
        
    }
    
    static func findviewsInStackView(view: UIView, stackViewIdentifier: String, identifier: String) -> UIView? {
        
        for subView in view.subviews {
            
            if let stackView = subView as? UIStackView {
                
                for subview in stackView.subviews {
                    
                    if(subview.accessibilityIdentifier == identifier) {
                        return subview
                    }
                    
                }
                
            }
            
        }
        return nil
        
    }
    
}
