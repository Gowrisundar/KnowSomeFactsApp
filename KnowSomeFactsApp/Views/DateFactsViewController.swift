//
//  DataFactsViewController.swift
//  KnowSomeFactsApp
//
//  Created by fordlabs on 19/08/19.
//  Copyright © 2019 fordlabs. All rights reserved.
//

import Foundation

import UIKit

class DateFactsViewController: UIViewController, UITextFieldDelegate {
    
    weak var delegate: FactsCoordinatorDelegate!
    
    var viewModel : FactsViewModel!
    
    private let dateLabel : UILabel = {
        let dateLabel = UILabel()
        dateLabel.accessibilityIdentifier = "dateLabel"
        dateLabel.textAlignment = .left
        dateLabel.text = "Date"
        dateLabel.numberOfLines = 0
        dateLabel.lineBreakMode = .byWordWrapping
        dateLabel.font = UIFont(name: "Georgia-Bold", size: 15.0)
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        return dateLabel
    }()
    
    private let monthLabel : UILabel = {
        let monthLabel = UILabel()
        monthLabel.accessibilityIdentifier = "monthLabel"
        monthLabel.textAlignment = .left
        monthLabel.text = "Month"
        monthLabel.numberOfLines = 0
        monthLabel.lineBreakMode = .byWordWrapping
        monthLabel.font = UIFont(name: "Georgia-Bold", size: 15.0)
        monthLabel.translatesAutoresizingMaskIntoConstraints = false
        return monthLabel
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
    
    
    private let submitBtn: UIButton = {
        let submitBtn = UIButton()
        submitBtn.accessibilityIdentifier = "submitBtn"
        submitBtn.setTitle("submit", for: .normal)
        submitBtn.setTitleColor(UIColor.blue, for: .normal)
        submitBtn.translatesAutoresizingMaskIntoConstraints = false
        return submitBtn
    }()
    
    private let dateTextField : UITextField = {
        let dateTextField = UITextField()
        let alignCenter = NSMutableParagraphStyle()
        alignCenter.alignment = NSTextAlignment.center
        dateTextField.borderStyle = UITextField.BorderStyle.roundedRect
        dateTextField.backgroundColor = UIColor.white
        dateTextField.attributedPlaceholder = NSAttributedString(string: "Enter Date", attributes: [
            .foregroundColor: UIColor.lightGray,
            .font: UIFont.boldSystemFont(ofSize: 10.0),
            .paragraphStyle: alignCenter])
        dateTextField.keyboardAppearance = UIKeyboardAppearance.light
        dateTextField.returnKeyType = UIReturnKeyType.done
        dateTextField.enablesReturnKeyAutomatically = true
        dateTextField.accessibilityIdentifier = "dateTextField"
        return dateTextField
    }()
    
    private let monthTextField : UITextField = {
        let monthTextField = UITextField()
        let alignCenter = NSMutableParagraphStyle()
        alignCenter.alignment = NSTextAlignment.center
        monthTextField.borderStyle = UITextField.BorderStyle.roundedRect
        monthTextField.backgroundColor = UIColor.white
        monthTextField.attributedPlaceholder = NSAttributedString(string: "Enter Month", attributes: [
            .foregroundColor: UIColor.lightGray,
            .font: UIFont.boldSystemFont(ofSize: 10.0),
            .paragraphStyle: alignCenter])
        monthTextField.keyboardAppearance = UIKeyboardAppearance.light
        monthTextField.returnKeyType = UIReturnKeyType.done
        monthTextField.enablesReturnKeyAutomatically = true
        monthTextField.accessibilityIdentifier = "monthTextField"
        return monthTextField
    }()
    
    init(viewModel: FactsViewModel){
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }
    
    func setUpViews(){
        view.backgroundColor = .white
        
        self.title = "Date Facts"
        
        view.addSubview(errorLabel)
        errorLabel.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview().multipliedBy(0.15)
            make.height.equalTo(30)
            make.width.equalToSuperview()
            make.leading.equalToSuperview().offset(10)
        }
        
        view.addSubview(dateLabel)
        dateLabel.snp.makeConstraints { (make) in
            make.top.equalTo(errorLabel.snp.bottom).offset(10)
            make.height.equalTo(15)
            make.width.equalTo(100)
            make.leading.equalToSuperview().offset(10)
        }
        
        view.addSubview(dateTextField)
        dateTextField.snp.makeConstraints { (make) in
           make.top.equalTo(errorLabel.snp.bottom).offset(10)
            make.height.equalTo(25)
            make.width.equalTo(250)
            make.trailing.equalToSuperview().offset(-10)
        }
        
        view.addSubview(monthLabel)
        monthLabel.snp.makeConstraints { (make) in
            make.top.equalTo(dateTextField.snp.bottom).offset(20)
            make.height.equalTo(15)
            make.width.equalTo(100)
            make.leading.equalToSuperview().offset(10)
        }
        
        view.addSubview(monthTextField)
        monthTextField.snp.makeConstraints { (make) in
            make.top.equalTo(dateTextField.snp.bottom).offset(20)
            make.height.equalTo(25)
            make.width.equalTo(250)
            make.trailing.equalToSuperview().offset(-10)
        }
        
        view.addSubview(submitBtn)
        submitBtn.snp.makeConstraints { (make) in
            make.top.equalTo(monthTextField.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.leading.equalToSuperview().offset(40)
        }
        dateTextField.delegate = self
        monthTextField.delegate = self
        submitBtn.addTarget(self, action: #selector(submitBtnIsTapped), for: .touchUpInside)
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @objc func submitBtnIsTapped() {
        viewModel.getDateFacts(date: dateTextField.text!, month: monthTextField.text!) { (factsModel, error) in
            
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
