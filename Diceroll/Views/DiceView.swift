//
//  DiceView.swift
//  Diceroll
//
//  Created by Adrian Borlido on 2/27/20.
//  Copyright © 2020 Adrian Borlido. All rights reserved.
//

import UIKit

class DiceView: UIView {
    var lblDiceName: UILabel!
//    let txtField = UITextField()
    let diceButton = UIButton()
    let amountSelectionView = AmountSelectionView()
    var dice: Dice!
    
    init(dice: Dice, selector: Selector, target: Any) {
        super.init(frame: CGRect())
        self.dice = dice
        diceButton.addTarget(target, action: selector, for: .touchUpInside)
        setupView()
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = .white
        layer.cornerRadius = 8
        clipsToBounds = true
        
        lblDiceName = UILabel()
        lblDiceName.text = dice.rawValue
        lblDiceName.font = lblDiceName.font.withSize(14)
        
        setupTags()
        diceButton.setImage(UIImage(named: dice.rawValue), for: .normal)
        
//        txtField.placeholder = "0"
//        txtField.textAlignment = .center
//        txtField.keyboardType = .numberPad
        
        amountSelectionView.translatesAutoresizingMaskIntoConstraints = false
        lblDiceName.translatesAutoresizingMaskIntoConstraints = false
        diceButton.translatesAutoresizingMaskIntoConstraints = false
//        txtField.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(amountSelectionView)
        addSubview(lblDiceName)
        addSubview(diceButton)
//        addSubview(txtField)
        
        constraintsInit()
    }
    
    private func constraintsInit() {
        NSLayoutConstraint.activate([
            widthAnchor.constraint(equalToConstant: 100),
            lblDiceName.centerXAnchor.constraint(equalTo: centerXAnchor),
            lblDiceName.topAnchor.constraint(equalTo: topAnchor, constant: 2.5),
            lblDiceName.heightAnchor.constraint(equalToConstant: 20),
            diceButton.topAnchor.constraint(equalTo: lblDiceName.bottomAnchor),
            diceButton.widthAnchor.constraint(equalToConstant: 50),
            diceButton.heightAnchor.constraint(equalToConstant: 50),
            diceButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            amountSelectionView.topAnchor.constraint(equalTo: diceButton.bottomAnchor, constant: 5),
            amountSelectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            amountSelectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            amountSelectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -2.5),
            amountSelectionView.heightAnchor.constraint(equalToConstant: 25)
        ])
    }
    
    private func setupTags() {
        var value: Int = 0
        
        switch dice {
        case .d2:
            value = 2
        case .d3:
            value = 3
        case .d4:
            value = 4
        case .d6:
            value = 6
        case .d8:
            value = 8
        case .d10:
            value = 10
        case .d12:
            value = 12
        case .d20:
            value = 20
        case .d100:
            value = 100
        case .none:
            value = 0
        }
        
        diceButton.tag = value
        amountSelectionView.textField.tag = value
    }
}
