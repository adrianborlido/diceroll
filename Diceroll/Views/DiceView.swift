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
    var imgViewDice: UIImageView!
    var txtField: UITextField!
    var stepper: UIStepper!

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    private func setupView() {
        backgroundColor = .white
        layer.cornerRadius = 8
        clipsToBounds = true
        
        lblDiceName = UILabel()
        lblDiceName.text = "d20"
        lblDiceName.font = lblDiceName.font.withSize(12)
        
        imgViewDice = UIImageView(image: UIImage(named: "d2020"))
        
        txtField = UITextField()
        txtField.placeholder = "0"
        txtField.textAlignment = .center
        
        stepper = UIStepper()
        stepper.autorepeat = true
        stepper.maximumValue = 50
        
        lblDiceName.translatesAutoresizingMaskIntoConstraints = false
        imgViewDice.translatesAutoresizingMaskIntoConstraints = false
        txtField.translatesAutoresizingMaskIntoConstraints = false
        stepper.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(lblDiceName)
        addSubview(imgViewDice)
        addSubview(txtField)
        addSubview(stepper)
        
        constraintsInit()
        
        // Add a function handler to be called when UIStepper value changes
        // myUIStepper.addTarget(self, action: #selector(ViewController.stepperValueChanged(_:)), for: .valueChanged)
    }
    
    private func constraintsInit() {
        NSLayoutConstraint.activate([
            widthAnchor.constraint(equalToConstant: 100),
            lblDiceName.centerXAnchor.constraint(equalTo: centerXAnchor),
            lblDiceName.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            lblDiceName.heightAnchor.constraint(equalToConstant: 20),
            imgViewDice.topAnchor.constraint(equalTo: lblDiceName.bottomAnchor, constant: 5),
            imgViewDice.widthAnchor.constraint(equalToConstant: 50),
            imgViewDice.heightAnchor.constraint(equalToConstant: 50),
            imgViewDice.centerXAnchor.constraint(equalTo: centerXAnchor),
            txtField.topAnchor.constraint(equalTo: imgViewDice.bottomAnchor, constant: 5),
            txtField.trailingAnchor.constraint(equalTo: trailingAnchor),
            txtField.leadingAnchor.constraint(equalTo: leadingAnchor),
//            txtField.bottomAnchor.constraint(equalTo: bottomAnchor),
            txtField.heightAnchor.constraint(equalToConstant: 20),
            stepper.topAnchor.constraint(equalTo: txtField.bottomAnchor),
            stepper.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
