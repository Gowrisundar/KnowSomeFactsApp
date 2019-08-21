//
//  FactsTableViewCell.swift
//  KnowSomeFactsApp
//
//  Created by fordlabs on 21/08/19.
//  Copyright © 2019 fordlabs. All rights reserved.
//

import Foundation

import UIKit
import SnapKit

class FactsTableViewCell : UITableViewCell {
    
    var factsData: CellDataModel? {
        
        didSet {
            basicInfoLabel.text = factsData?.key
            correspondingValueLabel.text = factsData?.value
        }
        
    }
    
    private let basicInfoLabel : UILabel = {
        let basicInfoLabel = UILabel()
        basicInfoLabel.accessibilityIdentifier = "basicInfoLabel"
        basicInfoLabel.textAlignment = .left
        basicInfoLabel.numberOfLines = 0
        basicInfoLabel.lineBreakMode = .byWordWrapping
        basicInfoLabel.font = UIFont(name: "Georgia-Bold", size: 15.0)
        basicInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        return basicInfoLabel
    }()
    
    private let correspondingValueLabel : UILabel = {
        let correspondingValueLabel = UILabel()
        correspondingValueLabel.accessibilityIdentifier = "correspondingValueLabel"
        correspondingValueLabel.textAlignment = .left
        correspondingValueLabel.numberOfLines = 0
        correspondingValueLabel.lineBreakMode = .byWordWrapping
        correspondingValueLabel.font = UIFont(name: "Georgia-Bold", size: 15.0)
        correspondingValueLabel.translatesAutoresizingMaskIntoConstraints = false
        return correspondingValueLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        buildViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildViews(){
        
        addSubview(basicInfoLabel)
        basicInfoLabel.snp.makeConstraints { (make) in
            make.top.equalTo(2)
            make.leading.equalToSuperview().offset(10)
            make.height.equalTo(100)
            make.trailing.equalToSuperview().multipliedBy(0.5)
        }
        
        addSubview(correspondingValueLabel)
        correspondingValueLabel.snp.makeConstraints { (make) in
            make.top.equalTo(2)
            make.trailing.equalToSuperview().offset(-10)
            make.height.equalTo(100)
            make.leading.equalTo(basicInfoLabel.snp.trailing).offset(5)
        }
    }
    
}

