//
//  HistorialCell.swift
//  Diceroll
//
//  Created by Adrian Borlido on 2/27/20.
//  Copyright © 2020 Adrian Borlido. All rights reserved.
//

import UIKit

class HistorialCell: UITableViewCell {
    var diceThrow: DiceThrow! {
        didSet {
            setupCell()
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView?.clipsToBounds = true
        imageView?.contentMode = .scaleAspectFit
    }
    
    func setupCell() {
        textLabel?.text = "PREVIOUS RESULT"
    }
}
