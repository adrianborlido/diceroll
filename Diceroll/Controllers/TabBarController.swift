//
//  TabBarController.swift
//  Diceroll
//
//  Created by Adrian Borlido on 2/25/20.
//  Copyright © 2020 Adrian Borlido. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = [MainViewController(), HistoryViewController()]
        
        let tabBarItem1 = UITabBarItem(tabBarSystemItem: .topRated, tag: 0)
        let tabBarItem2 = UITabBarItem(tabBarSystemItem: .history, tag: 1)
        
        viewControllers?[0].tabBarItem = tabBarItem1
        viewControllers?[1].tabBarItem = tabBarItem2
    }
}
