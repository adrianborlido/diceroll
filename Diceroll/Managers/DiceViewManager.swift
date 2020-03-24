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
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentText = textField.text ?? ""
        guard let stringRange = Range(range, in: currentText) else { return false }
        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
        return updatedText.count <= 2
    }
}
