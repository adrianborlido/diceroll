//
//  StackProvider.swift
//  Diceroll
//
//  Created by Adrian Borlido on 3/8/20.
//  Copyright © 2020 Adrian Borlido. All rights reserved.
//

import UIKit

class StackProvider {
    
    static func getDiceStack(target: Any, selector: Selector) -> UIStackView {
        
        let firstStack = UIStackView(arrangedSubviews: [DiceView(dice: .d4, selector: selector, target: target),
                                                        DiceView(dice: .d6, selector: selector, target: target),
                                                        DiceView(dice: .d8, selector: selector, target: target)])
        
        let secondStack = UIStackView(arrangedSubviews: [DiceView(dice: .d10, selector: selector, target: target),
                                                         DiceView(dice: .d12, selector: selector, target: target),
                                                         DiceView(dice: .d20, selector: selector, target: target)])
        
        firstStack.distribution = .equalCentering
        secondStack.distribution = .equalCentering
        
        return UIStackView(arrangedSubviews: [firstStack, secondStack])
    }
}
