//
//  LabelView.swift
//  Lesson2_8
//
//  Created by Evgeny Mastepan on 10.12.2024.
//

import UIKit

class LabelView: UILabel {
    init(font: UIFont = .systemFont(ofSize: 14, weight: .regular), color: UIColor = .black, const: Bool = false) {
        super.init(frame: .zero)
        self.font = font
        if const { self.translatesAutoresizingMaskIntoConstraints = false }
        self.textColor = color
        self.numberOfLines = 0
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
