//
//  HistoryViewController.swift
//  Diceroll
//
//  Created by Adrian Borlido on 2/25/20.
//  Copyright © 2020 Adrian Borlido. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController {
    let tableView = UITableView(frame: CGRect(), style: .grouped)
    let tableManager = TableManager()
    var safeArea: UILayoutGuide!

    //ADD A CLEAR FUNCTION TO THE HISTORY
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Throw History"
        view.backgroundColor = UIColor(red:0.70, green:0.75, blue:0.76, alpha:1.0)
        safeArea = view.layoutMarginsGuide
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = UIColor(red:0.70, green:0.75, blue:0.76, alpha:1.0)
        view.addSubview(tableView)
        tableView.delegate = tableManager
        tableView.dataSource = tableManager
        
        constraintsInit()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    private func constraintsInit(){
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.topAnchor.constraint(equalTo: safeArea.topAnchor)
        ])
    }
}

