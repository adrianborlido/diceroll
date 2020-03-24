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
    let tableManager = HistoryTableManager()

    //ADD A CLEAR FUNCTION TO THE HISTORY
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Throw History"
        view.backgroundColor = UIColor(named: "LightGray")

        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = UIColor(named: "LightGray")
        tableView.delegate = tableManager
        tableView.dataSource = tableManager
        
        view.addSubview(tableView)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Clear", style: .done, target: self, action: #selector(clearHistory))
        
        constraintsInit()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    private func constraintsInit() {
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor)
        ])
    }
    
    @objc func clearHistory() {
        HistoryManager.shared.clearHistory()
        tableView.reloadData()
    }
}
