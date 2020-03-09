//
//  HistorialCell.swift
//  Diceroll
//
//  Created by Adrian Borlido on 2/27/20.
//  Copyright © 2020 Adrian Borlido. All rights reserved.
//

import UIKit

class RollHistoryCell: UITableViewCell {
    
    init(diceRoll: DiceRoll) {
        super.init(style: .subtitle, reuseIdentifier: "cell")
        
        textLabel?.text = "Result: \(diceRoll.result)"
        detailTextLabel?.text = "Date: \(Formatter().formatDate(diceRoll.date))"
        imageView?.image = UIImage(named: diceRoll.dice.rawValue)
        
        if diceRoll.result == 1 {
            backgroundColor = UIColor(red:0.98, green:0.69, blue:0.63, alpha:1.0)
        }else if diceRoll.result == diceRoll.maxValue {
            backgroundColor = UIColor(red:0.51, green:0.93, blue:0.93, alpha:1.0)
        }
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
}
