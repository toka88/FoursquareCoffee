//
//  ECCoffeeListViewController.swift
//  EnvoyCoffee
//
//  Created by Goran Tokovic on 11/19/18.
//  Copyright © 2018 Goran Tokovic. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class ECCoffeeListViewController: ECBaseViewController {
    //UI
    fileprivate lazy var tableView: UITableView = {
        let tableView = UITableView.init(frame: .zero, style: .plain)
        tableView.register(ECCoffeeShopCell.self, forCellReuseIdentifier: coffeeCellReuseIdentifier)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 370
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    fileprivate lazy var activityIndicator : UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView.init(style: .gray)
        activityIndicator.hidesWhenStopped = true
        activityIndicator.backgroundColor = .white
        return activityIndicator
    }()
    
    //Data
    private let coffeeCellReuseIdentifier = "coffeeCellReuseIdentifier"
    private var viewModel: ECCoffeeListViewModel!
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super .viewDidLoad()
        
        dataInit()
        uiInit()
    }
    
    private func dataInit(){
        title = NSLocalizedString("Coffee shops", comment: "")
        viewModel = ECCoffeeListViewModel()
        showActivityIndicator(true)
        viewModel.fetchDataFromServer { (success) in
            self.showActivityIndicator(false)
            if success{
                self.tableView.reloadData()
            }
        }
    }
    
    private func uiInit(){
        //Table view
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        //Activity indicator
        view.addSubview(activityIndicator)
        activityIndicator.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    //MARK: Private
    private func showActivityIndicator(_ answer: Bool){
        if answer{
            activityIndicator.startAnimating()
            activityIndicator.isHidden = false
        }else{
            activityIndicator.stopAnimating()
            activityIndicator.isHidden = true
        }
    }
}

extension ECCoffeeListViewController: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.coffeeShopsNumber()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: coffeeCellReuseIdentifier) as? ECCoffeeShopCell
        guard let safeCell = cell else {
            return UITableViewCell()
        }
        safeCell.viewModel = viewModel.dataModelForCell(atIndex: indexPath.row)
        return safeCell
    }
}
