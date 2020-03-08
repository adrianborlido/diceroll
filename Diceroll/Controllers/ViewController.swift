//
//  ViewController.swift
//  Diceroll
//
//  Created by Adrian Borlido on 2/25/20.
//  Copyright © 2020 Adrian Borlido. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var btnRoll: UIButton!
    var lblResult: UILabel!
    var safeArea: UILayoutGuide!
    var horizontalStack: UIStackView!
    var verticalStack: UIStackView!
    var container: DiceView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor(red:0.70, green:0.75, blue:0.76, alpha:1.0)
        safeArea = view.layoutMarginsGuide
        title = "Home"
        
//        btnRoll = UIButton(type: .system)
//        btnRoll.setTitle("ROLL", for: .normal)
//        btnRoll.backgroundColor = .white
//        btnRoll.layer.cornerRadius = 8
//        btnRoll.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(btnRoll)
//        btnRoll.addTarget(self, action: #selector(rollTap), for: .touchUpInside)
//
//        lblResult = UILabel(frame: .zero)
//        lblResult.textColor = .blue
//        lblResult.textAlignment = .center
//        lblResult.backgroundColor = .white
//        lblResult.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(lblResult)
        
        container = DiceView()
        container.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(container)
        
        constraintsInit()
    }
    
    private func constraintsInit() {
        NSLayoutConstraint.activate([
//            btnRoll.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            btnRoll.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//            btnRoll.widthAnchor.constraint(equalToConstant: 100),
//            lblResult.bottomAnchor.constraint(equalTo: btnRoll.topAnchor, constant: -20),
//            lblResult.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            lblResult.heightAnchor.constraint(equalToConstant: 40),
//            lblResult.widthAnchor.constraint(equalToConstant: 40),
            container.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            container.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    @objc private func rollTap() {
        lblResult.text = Int.random(in: 1...20).description
        if lblResult.text == "20" || lblResult.text == "1" {
            lblResult.textColor = .red
        }else{
            lblResult.textColor = .blue
        }
    }
}
