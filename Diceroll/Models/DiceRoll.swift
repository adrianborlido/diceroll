//
//  DiceRoll.swift
//  Diceroll
//
//  Created by Adrian Borlido on 2/27/20.
//  Copyright © 2020 Adrian Borlido. All rights reserved.
//

import Foundation

struct DiceRoll {
    var date: Date
    var dice: Dice
    var result: Int
    var quantity: Int
    var maxValue: Int
}

// swiftlint:disable variable_name

enum Dice: String {
    case d2
    case d3
    case d4
    case d6
    case d8
    case d10
    case d12
    case d20
    case d100
}

// swiftlint:enable variable_name
