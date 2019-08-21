//
//  ViewController.swift
//  KnowSomeFactsApp
//
//  Created by fordlabs on 19/08/19.
//  Copyright © 2019 fordlabs. All rights reserved.
//

import UIKit
import SnapKit

class KnowSomeFactsViewController: UIViewController {
    
    weak var delegate: KnowSomeFactViewControllerDelegate!
    
    private let titleLabel : UILabel = {
        let titleLabel = UILabel()
        titleLabel.accessibilityIdentifier = "titleLabel"
        titleLabel.textAlignment = .center
        titleLabel.text = "Know Some Facts"
        titleLabel.numberOfLines = 0
        titleLabel.lineBreakMode = .byWordWrapping
        titleLabel.font = UIFont(name: "Georgia-Bold", size: 25.0)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()
    
    private let informationLabel : UILabel = {
        let informationLabel = UILabel()
        informationLabel.accessibilityIdentifier = "informationLabel"
        informationLabel.textAlignment = .center
        informationLabel.text = "Click on any of the button to know the facts"
        informationLabel.numberOfLines = 0
        informationLabel.lineBreakMode = .byWordWrapping
        informationLabel.font = UIFont(name: "Georgia-Bold", size: 20.0)
        informationLabel.translatesAutoresizingMaskIntoConstraints = false
        return informationLabel
    }()
    
    
    private let dateFactsBtn: UIButton = {
        let dateFactsBtn = UIButton()
        dateFactsBtn.accessibilityIdentifier = "dateFactsBtn"
        dateFactsBtn.setTitle("Date Facts", for: .normal)
        dateFactsBtn.setTitleColor(UIColor.blue, for: .normal)
        dateFactsBtn.translatesAutoresizingMaskIntoConstraints = false
        return dateFactsBtn
    }()
    
    private let yearFactsBtn: UIButton = {
        let yearFactsBtn = UIButton()
        yearFactsBtn.accessibilityIdentifier = "yearFactsBtn"
        yearFactsBtn.setTitle("Year Facts", for: .normal)
        yearFactsBtn.setTitleColor(UIColor.blue, for: .normal)
        yearFactsBtn.translatesAutoresizingMaskIntoConstraints = false
        return yearFactsBtn
    }()
    
    private let mathFactsBtn: UIButton = {
        let mathFactsBtn = UIButton()
        mathFactsBtn.accessibilityIdentifier = "mathFactsBtn"
        mathFactsBtn.setTitle("Math Facts", for: .normal)
        mathFactsBtn.setTitleColor(UIColor.blue, for: .normal)
        mathFactsBtn.translatesAutoresizingMaskIntoConstraints = false
        return mathFactsBtn
    }()
    
    private let buttonStackView: UIStackView = {
        let buttonStackView = UIStackView()
        buttonStackView.accessibilityIdentifier = "buttonStackView"
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonStackView.axis = .vertical
        buttonStackView.spacing = 50.0
        return buttonStackView
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }

    func setUpViews(){
        
        view.backgroundColor = .white
        self.title = "Home"
        buttonStackView.addArrangedSubview(dateFactsBtn)
        buttonStackView.addArrangedSubview(yearFactsBtn)
        buttonStackView.addArrangedSubview(mathFactsBtn)
        
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview().multipliedBy(0.25)
            make.centerX.equalToSuperview()
            make.leading.equalToSuperview().offset(100)
        }
        
        view.addSubview(informationLabel)
        informationLabel.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.leading.equalToSuperview().offset(50)
        }
        
        view.addSubview(buttonStackView)
        buttonStackView.snp.makeConstraints { (make) in
            make.top.equalTo(informationLabel.snp.bottom).offset(100)
            make.centerX.equalToSuperview()
            make.leading.equalToSuperview().offset(30)
        }
        
        dateFactsBtn.addTarget(self, action: #selector(dateFactsBtnIsTapped), for: .touchUpInside)
        yearFactsBtn.addTarget(self, action: #selector(yearFactsBtnIsTapped), for: .touchUpInside)
        mathFactsBtn.addTarget(self, action: #selector(mathFactsBtnIsTapped), for: .touchUpInside)
        
    }
    

    @objc func dateFactsBtnIsTapped(_ sender: UIButton) {
        delegate.dateFactsBtnIsTapped()
    }
    
    @objc func yearFactsBtnIsTapped(_ sender: UIButton) {
        delegate.yearFactsBtnIsTapped()
    }
    
    @objc func mathFactsBtnIsTapped(_ sender: UIButton) {
        delegate.mathFactsBtnIsTapped()
    }
    
    
}

