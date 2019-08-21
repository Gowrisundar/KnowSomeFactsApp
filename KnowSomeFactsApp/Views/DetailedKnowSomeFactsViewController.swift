//
//  DetailedKnowSomeFactsViewController.swift
//  KnowSomeFactsApp
//
//  Created by fordlabs on 19/08/19.
//  Copyright © 2019 fordlabs. All rights reserved.
//

import Foundation
import UIKit

class DetailedKnowSomeFactsViewController: UIViewController {
    
    var data: FactsModel!
    
    var keyArray = [String]()
    
    var valueArray = [String]()
    
   
    
    private let factsTableView : UITableView = {
        let factsTableView = UITableView()
        factsTableView.accessibilityIdentifier = "factsTableView"
        factsTableView.translatesAutoresizingMaskIntoConstraints = false
        factsTableView.separatorColor = .clear
        factsTableView.allowsSelection = false
        return factsTableView
    }()
    
    init(data: FactsModel){
        self.data = data
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    func setUpView() {
        
        let topBarHeight = UIApplication.shared.statusBarFrame.size.height +
            (self.navigationController?.navigationBar.frame.height ?? 0.0)
        
        view.backgroundColor = .white
        self.title = "Facts"
        view.addSubview(factsTableView)
        factsTableView.snp.makeConstraints { (make) in
            make.top.equalTo(topBarHeight)
            make.leading.equalToSuperview()
            make.bottom.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
        factsTableView.delegate = self
        factsTableView.dataSource = self
        factsTableView.register(FactsTableViewCell.self, forCellReuseIdentifier: "FactsCellIdentifier")
        createFactsArray()
        
    }
    
    
}

extension DetailedKnowSomeFactsViewController: UITableViewDataSource,UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return keyArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FactsCellIdentifier") as! FactsTableViewCell
        let cellDataModel = CellDataModel(key: keyArray[indexPath.row], value: valueArray[indexPath.row])
        cell.factsData = cellDataModel
        return cell
    }
    
    func createFactsArray(){
        
        keyArray.append("Text")
        valueArray.append(data.text)
        
        keyArray.append("Found")
        valueArray.append("\(data.found)")
        
        keyArray.append("Number")
        valueArray.append("\(data.number)")
        
        keyArray.append("Type")
        valueArray.append("\(data.type)")
        
        if let date = data.date {
            keyArray.append("Date")
            valueArray.append(date)
        }
        
        if let year = data.year {
            keyArray.append("Year")
            valueArray.append("\(year)")
        }
        
        
    }
    
    
}
