//
//  ButtonView.swift
//  Lesson2_8
//
//  Created by Evgeny Mastepan on 12.12.2024.
//

import UIKit

class ButtonView: UIButton {
    init(text: String, color: UIColor = .systemGreen, textColor: UIColor = .white, const: Bool = false) {
        super.init(frame: .zero)
        if const { self.translatesAutoresizingMaskIntoConstraints = false }
        self.backgroundColor = color
        self.setTitle(text, for: .normal)
        self.setTitleColor(textColor, for: .normal)
        self.layer.cornerRadius = 20
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
    
