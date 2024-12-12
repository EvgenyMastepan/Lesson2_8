//
//  CellView.swift
//  Lesson2_8
//
//  Created by Evgeny Mastepan on 10.12.2024.
//

import UIKit

class CellView: UICollectionViewCell {
    static let identifier: String = "CellView"
   
    let leftIndent: CGFloat = 15
    
    lazy var imageView: UIImageView = {
        $0.frame.size = CGSize(width: frame.width, height: 180)
        $0.frame.origin = .zero
        $0.contentMode = .scaleAspectFit
        $0.clipsToBounds = true
        return $0
    }(UIImageView())
    
    lazy var vStack: UIStackView = {
        $0.axis = .vertical
        $0.distribution = .equalSpacing
        $0.spacing = 5
        $0.frame.origin = CGPoint(x: 0, y: imageView.frame.maxY)
        $0.frame.size = CGSize(width: frame.width, height: 100)
        $0.addArrangedSubview(hStack)
        $0.addArrangedSubview(modelLabel)
        $0.addArrangedSubview(dataLabel)
        $0.addArrangedSubview(buyButton)
        return $0
    }(UIStackView())
    
    lazy var hStack: UIStackView = {
        $0.axis = .horizontal
        $0.distribution = .equalSpacing
        $0.spacing = 10
        $0.frame.origin = CGPoint(x: 0, y: 0)
        $0.frame.size = CGSize(width: frame.width - 20, height: 24)
        $0.addArrangedSubview(priceLabel)
        $0.addArrangedSubview(bookmarkImage)
        return $0
    }(UIStackView())
    
    lazy var priceLabel = LabelView(font: .systemFont(ofSize: 14, weight: .bold), color: .red)
    
    lazy var bookmarkImage: UIImageView = {
        $0.frame.size = CGSize(width: 20, height: 20)
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFit
        $0.image = UIImage(systemName: "bookmark")
        return $0
    }(UIImageView())
    
    lazy var modelLabel = LabelView()
    lazy var dataLabel = LabelView()
    
    lazy var buyButton = ButtonView(text: "Купить")
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        clipsToBounds = true
        layer.cornerRadius = 10
        backgroundColor = .white
        
        contentView.addSubview(imageView)
        contentView.addSubview(vStack)
    }
    
    func setupCell(data: Card) {
        imageView.image = UIImage(named: data.image)
        priceLabel.text = data.price
        modelLabel.text = data.model
        dataLabel.text = data.data
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
    


