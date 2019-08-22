//
//  MathFactsViewController.swift
//  KnowSomeFactsApp
//
//  Created by fordlabs on 19/08/19.
//  Copyright © 2019 fordlabs. All rights reserved.
//

import Foundation
import UIKit

class MathFactsViewController: UIViewController, UITextFieldDelegate {
    
    weak var delegate: FactsCoordinatorDelegate!
    
    var viewModel: FactsViewModel!
    
    private let mathLabel : UILabel = {
        let mathLabel = UILabel()
        mathLabel.accessibilityIdentifier = "mathLabel"
        mathLabel.textAlignment = .left
        mathLabel.text = "Number"
        mathLabel.numberOfLines = 0
        mathLabel.lineBreakMode = .byWordWrapping
        mathLabel.font = UIFont(name: "Georgia-Bold", size: 15.0)
        mathLabel.translatesAutoresizingMaskIntoConstraints = false
        return mathLabel
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
    
    private let mathTextField : UITextField = {
        let mathTextField = UITextField()
        let alignCenter = NSMutableParagraphStyle()
        alignCenter.alignment = NSTextAlignment.center
        mathTextField.borderStyle = UITextField.BorderStyle.roundedRect
        mathTextField.backgroundColor = UIColor.white
        mathTextField.attributedPlaceholder = NSAttributedString(string: "Enter Number", attributes: [
            .foregroundColor: UIColor.lightGray,
            .font: UIFont.boldSystemFont(ofSize: 10.0),
            .paragraphStyle: alignCenter])
        mathTextField.keyboardAppearance = UIKeyboardAppearance.light
        mathTextField.returnKeyType = UIReturnKeyType.done
        mathTextField.enablesReturnKeyAutomatically = true
        mathTextField.accessibilityIdentifier = "mathTextField"
        return mathTextField
    }()
    
    private let submitBtn: UIButton = {
        let submitBtn = UIButton()
        submitBtn.accessibilityIdentifier = "submitBtn"
        submitBtn.setTitle("submit", for: .normal)
        submitBtn.setTitleColor(UIColor.blue, for: .normal)
        submitBtn.translatesAutoresizingMaskIntoConstraints = false
        return submitBtn
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
        
        self.title = "Math Facts"
        
        view.addSubview(errorLabel)
        errorLabel.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview().multipliedBy(0.15)
            make.height.equalTo(30)
            make.width.equalToSuperview()
            make.leading.equalToSuperview().offset(10)
        }
        
        view.addSubview(mathLabel)
        mathLabel.snp.makeConstraints { (make) in
            make.top.equalTo(errorLabel.snp.bottom).offset(10)
            make.height.equalTo(15)
            make.width.equalTo(100)
            make.leading.equalToSuperview().offset(10)
        }
        
        view.addSubview(mathTextField)
        mathTextField.snp.makeConstraints { (make) in
            make.top.equalTo(errorLabel.snp.bottom).offset(10)
            make.height.equalTo(25)
            make.width.equalTo(250)
            make.trailing.equalToSuperview().offset(-10)
        }
        
        view.addSubview(submitBtn)
        submitBtn.snp.makeConstraints { (make) in
            make.top.equalTo(mathTextField.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.leading.equalToSuperview().offset(40)
        }
        
        mathTextField.delegate = self
        submitBtn.addTarget(self, action: #selector(submitBtnIsTapped), for: .touchUpInside)
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @objc func submitBtnIsTapped() {
        viewModel.getMathFacts(math: mathTextField.text!) { (factsModel, error) in
            
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
