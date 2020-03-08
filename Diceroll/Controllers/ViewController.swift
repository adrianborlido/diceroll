//
//  ViewController.swift
//  Diceroll
//
//  Created by Adrian Borlido on 2/25/20.
//  Copyright © 2020 Adrian Borlido. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var verticalStack: UIStackView!
    var lblResult: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        constraintsInit()
    }
    
    private func setupView() {
        view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:))))
        view.backgroundColor = UIColor(red:0.70, green:0.75, blue:0.76, alpha:1.0)
        
        verticalStack = DiceViewProvider.getDiceStack(target: self, selector: #selector(rollTap))
        verticalStack.axis = .vertical
        verticalStack.distribution = .equalCentering
        verticalStack.translatesAutoresizingMaskIntoConstraints = false
        
        lblResult = UILabel()
        lblResult.translatesAutoresizingMaskIntoConstraints = false
        lblResult.text = "THE RESULT OF THE THROW"
        
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
    
    @objc private func rollTap(sender: UIButton) {
        lblResult.text = Int.random(in: 1...sender.tag).description
        
        if lblResult.text == "1" {
            lblResult.textColor = .red
        }else if lblResult.text == sender.tag.description {
            lblResult.textColor = .blue
        }else{
            lblResult.textColor = .black
        }
    }
}
