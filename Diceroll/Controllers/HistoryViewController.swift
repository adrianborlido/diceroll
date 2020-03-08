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

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Roll History"
        view.backgroundColor = UIColor(red:0.87, green:0.90, blue:0.91, alpha:1.0)
        safeArea = view.layoutMarginsGuide
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        tableView.delegate = tableManager
        tableView.dataSource = tableManager
        constraintsInit()
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

