//
//  AmountSelectionView.swift
//  Diceroll
//
//  Created by Mobile on 3/24/20.
//  Copyright © 2020 Adrian Borlido. All rights reserved.
//

import UIKit

class AmountSelectionView: UIView, UITextFieldDelegate {
    var textField = UITextField()
    var leftButton = UIButton()
    var rightButton = UIButton()
    var currentValue: Int = 0
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupView()
    }
    
    private func setupView() {
        backgroundColor = .clear
        
        leftButton.setTitle("-", for: .normal)
        rightButton.setTitle("+", for: .normal)
        leftButton.layer.cornerRadius = 4
        rightButton.layer.cornerRadius = 4
        leftButton.setTitleColor(.black, for: .normal)
        rightButton.setTitleColor(.black, for: .normal)
        leftButton.backgroundColor = UIColor(named: "LightPink")
        rightButton.backgroundColor = UIColor(named: "LightBlue")
        leftButton.tag = -1
        rightButton.tag = 1
        leftButton.addTarget(self, action: #selector(buttonTap(_:)), for: .touchUpInside)
        rightButton.addTarget(self, action: #selector(buttonTap(_:)), for: .touchUpInside)
        
        textField.placeholder = "0"
        textField.textAlignment = .center
        textField.keyboardType = .numberPad
        textField.delegate = self
        
        leftButton.translatesAutoresizingMaskIntoConstraints = false
        rightButton.translatesAutoresizingMaskIntoConstraints = false
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(leftButton)
        addSubview(rightButton)
        addSubview(textField)
        
        constraintsInit()
    }
    
    private func constraintsInit() {
        NSLayoutConstraint.activate([
            leftButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            leftButton.widthAnchor.constraint(equalToConstant: 25),
            leftButton.heightAnchor.constraint(equalToConstant: 25),
            leftButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            textField.centerYAnchor.constraint(equalTo: centerYAnchor),
            textField.leadingAnchor.constraint(equalTo: leftButton.trailingAnchor, constant: 5),
            textField.trailingAnchor.constraint(equalTo: rightButton.leadingAnchor, constant: -5),
            rightButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            rightButton.widthAnchor.constraint(equalToConstant: 25),
            rightButton.heightAnchor.constraint(equalToConstant: 25),
            rightButton.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    @objc private func buttonTap(_ sender: UIButton) {
        if currentValue != 99 && sender.tag == 1 || currentValue != 0 && sender.tag == -1 {
            currentValue += sender.tag
            textField.text = currentValue.description
        }
    }
}
