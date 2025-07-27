//
//  CustomButton.swift
//  MiniBank
//
//  Created by Beshoy Atef on 26/07/2025.
//

import UIKit

class CustomButton: UIButton {

    override func awakeFromNib() {
        layer.cornerRadius = frame.size.height / 2
        layer.borderWidth = 1
        layer.borderColor = UIColor.black.cgColor
        clipsToBounds = true
    }
}
