//
//  GameCollectionViewCell.swift
//  Bowling
//
//  Created by Víctor Jiménez on 19/08/2020.
//  Copyright © 2020 Víctor Jiménez. All rights reserved.
//

import UIKit

class GameCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var identifierLabel: UILabel!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var firstThrow: UITextField! {
        didSet {
            firstThrow.keyboardType = .numberPad
            firstThrow.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        }
    }
    @IBOutlet weak var secondThrow: UITextField!
    var thridThrow: UITextField?
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        identifierLabel.text = ""
        firstThrow.text = ""
        secondThrow.text = ""
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        if textField.text == "10" && identifierLabel.text != "10" {
            textField.backgroundColor = .red
            secondThrow.isHidden = true
        } else {
            textField.backgroundColor = .white
            secondThrow.isHidden = false
        }
    }
    
    func addExtraSpace() {
        thridThrow = UITextField()
        thridThrow?.borderStyle = .roundedRect
        stackView.addArrangedSubview(thridThrow!)
    }
}
