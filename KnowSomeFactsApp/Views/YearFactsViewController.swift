//
//  YearFactsViewController.swift
//  KnowSomeFactsApp
//
//  Created by fordlabs on 19/08/19.
//  Copyright © 2019 fordlabs. All rights reserved.
//

import Foundation
import UIKit

class YearFactsViewController: UIViewController, UITextFieldDelegate {
    
    weak var delegate: FactsCoordinatorDelegate!
    
    var viewModel = FactsViewModel(apiClient: KnowSomeFactsRapidAPI())
    
    private let yearLabel : UILabel = {
        let yearLabel = UILabel()
        yearLabel.accessibilityIdentifier = "yearLabel"
        yearLabel.textAlignment = .left
        yearLabel.text = "Year"
        yearLabel.numberOfLines = 0
        yearLabel.lineBreakMode = .byWordWrapping
        yearLabel.font = UIFont(name: "Georgia-Bold", size: 15.0)
        yearLabel.translatesAutoresizingMaskIntoConstraints = false
        return yearLabel
    }()
    
    private let errorLabel : UILabel = {
        let errorLabel = UILabel()
        errorLabel.accessibilityIdentifier = "errorLabel"
        errorLabel.textAlignment = .left
        errorLabel.numberOfLines = 0
        errorLabel.lineBreakMode = .byWordWrapping
        errorLabel.font = UIFont(name: "Georgia-Bold", size: 15.0)
        errorLabel.translatesAutoresizingMaskIntoConstraints = false
        return errorLabel
    }()
    
    private let yearTextField : UITextField = {
        let yearTextField = UITextField()
        let alignCenter = NSMutableParagraphStyle()
        alignCenter.alignment = NSTextAlignment.center
        yearTextField.borderStyle = UITextField.BorderStyle.roundedRect
        yearTextField.backgroundColor = UIColor.white
        yearTextField.attributedPlaceholder = NSAttributedString(string: "Enter Year", attributes: [
            .foregroundColor: UIColor.lightGray,
            .font: UIFont.boldSystemFont(ofSize: 10.0),
            .paragraphStyle: alignCenter])
        yearTextField.keyboardAppearance = UIKeyboardAppearance.light
        yearTextField.returnKeyType = UIReturnKeyType.done
        yearTextField.enablesReturnKeyAutomatically = true
        yearTextField.accessibilityIdentifier = "yearTextField"
        return yearTextField
    }()
    
    private let submitBtn: UIButton = {
        let submitBtn = UIButton()
        submitBtn.accessibilityIdentifier = "submitBtn"
        submitBtn.setTitle("submit", for: .normal)
        submitBtn.setTitleColor(UIColor.blue, for: .normal)
        submitBtn.translatesAutoresizingMaskIntoConstraints = false
        return submitBtn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }
    
    func setUpViews(){
        view.backgroundColor = .white
        
        self.title = "Year Facts"
        
        view.addSubview(errorLabel)
        errorLabel.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview().multipliedBy(0.15)
            make.height.equalTo(30)
            make.width.equalToSuperview()
            make.leading.equalToSuperview().offset(10)
        }
        
        view.addSubview(yearLabel)
        yearLabel.snp.makeConstraints { (make) in
            make.top.equalTo(errorLabel.snp.bottom).offset(10)
            make.height.equalTo(15)
            make.width.equalTo(100)
            make.leading.equalToSuperview().offset(10)
        }
        
        view.addSubview(yearTextField)
        yearTextField.snp.makeConstraints { (make) in
            make.top.equalTo(errorLabel.snp.bottom).offset(10)
            make.height.equalTo(25)
            make.width.equalTo(250)
            make.trailing.equalToSuperview().offset(-10)
        }
        
        view.addSubview(submitBtn)
        submitBtn.snp.makeConstraints { (make) in
            make.top.equalTo(yearTextField.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.leading.equalToSuperview().offset(40)
        }
        
        yearTextField.delegate = self
        submitBtn.addTarget(self, action: #selector(submitBtnIsTapped), for: .touchUpInside)
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @objc func submitBtnIsTapped() {
        viewModel.getYearFacts(year: yearTextField.text!) { (factsModel, error) in
            
            DispatchQueue.main.async {
                
                if factsModel != nil, error == nil {
                    guard let factModel = factsModel else {
                        print("factsModel is Nil")
                        return
                    }
                    self.delegate.submitButtonIsTapped(data: factModel)
                }else {
                    self.errorLabel.text = "Invalid Data. Enter Valid Data"
                }
            }
            
        }
    }
    
}
