//
//  DiceViewManager.swift
//  Diceroll
//
//  Created by Adrian Borlido on 3/9/20.
//  Copyright © 2020 Adrian Borlido. All rights reserved.
//

import Foundation
import UIKit

class DiceViewManager: NSObject, UITextFieldDelegate, DiceViewDelegate {

    @objc func rollTap(sender: UIButton) {
        let value = Int.random(in: 1...sender.tag)

        // USER ALERT TO DISPLAY RESULT?
        print(value)

        let diceRoll = DiceRoll(date: Date(), dice: Dice(rawValue: "d\(sender.tag)") ?? .d20, result: value, quantity: 1, maxValue: sender.tag)
        HistoryManager.shared.history.append(diceRoll)
    }
}
