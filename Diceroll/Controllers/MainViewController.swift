//
//  MainViewController.swift
//  Diceroll
//
//  Created by Adrian Borlido on 2/25/20.
//  Copyright © 2020 Adrian Borlido. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    var verticalStack: UIStackView!
    var lblResult: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        constraintsInit()
    }

    private func setupView() {
        view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:))))
        view.backgroundColor = UIColor(named: "LightGray")
        
        verticalStack = StackProvider.getDiceStack(target: self, selector: #selector(rollTap))
        verticalStack.axis = .vertical
        verticalStack.distribution = .equalCentering
        verticalStack.translatesAutoresizingMaskIntoConstraints = false
        
        lblResult = UILabel()
        lblResult.translatesAutoresizingMaskIntoConstraints = false
        lblResult.text = "RESULT"
        
        view.addSubview(verticalStack)
        view.addSubview(lblResult)
    }
    
    private func constraintsInit() {
        NSLayoutConstraint.activate([
            verticalStack.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            verticalStack.heightAnchor.constraint(equalToConstant: 210),
            verticalStack.widthAnchor.constraint(equalToConstant: 330),
            verticalStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            lblResult.topAnchor.constraint(equalTo: verticalStack.bottomAnchor, constant: 50),
            lblResult.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}

extension MainViewController {

    @objc private func rollTap(sender: UIButton) {
        let value = Int.random(in: 1...sender.tag)

        lblResult.text = value.description

        // USER ALERT TO DISPLAY RESULT?

        if value == 1 {
            lblResult.textColor = .red
        }else if value == sender.tag {
            lblResult.textColor = .blue
        }else {
            lblResult.textColor = .black
        }

        HistoryManager.shared.history.append(DiceRoll(date: Date(), dice: Dice(rawValue: "d\(sender.tag)") ?? .d20, result: value, quantity: 1, maxValue: sender.tag))
    }
}
