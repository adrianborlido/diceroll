//
//  HistoryManager.swift
//  Diceroll
//
//  Created by Adrian Borlido on 3/8/20.
//  Copyright © 2020 Adrian Borlido. All rights reserved.
//

import Foundation

class HistoryManager {
    static let shared = HistoryManager()
    private init() {}
    
    var history = [DiceRoll]()
    var sortedHistory: [DiceRoll] {
        return history.sorted(by: {$0.date > $1.date})
    }
    
    @objc func clearHistory() {
        history = [DiceRoll]()
    }
}
