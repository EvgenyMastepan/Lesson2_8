//
//  ContentViewController.swift
//  Lesson2_8
//
//  Created by Evgeny Mastepan on 11.12.2024.
//

import UIKit

class ContentViewController: UIViewController{
    
    let leftIndent: CGFloat = 15
    let data = Card.cards
    
    var numPage: Int
    
    lazy var scrollView: UIScrollView = {
        $0.contentInsetAdjustmentBehavior = .never
        $0.backgroundColor = .systemGray6
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.addSubview(scrollViewContent)
        return $0
    }(UIScrollView())

    lazy var topImage: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFill
        return $0
    }(UIImageView())
    
    lazy var priceLabel = LabelView(font: .systemFont(ofSize: 34, weight: .bold), color: .red, const: true)
    lazy var modelLabel = LabelView(font: .systemFont(ofSize: 20, weight: .regular), color: .black, const: true)
    lazy var bigDataLabel = LabelView(const: true)
    
    lazy var hStack: UIStackView = {
        $0.axis = .horizontal
        $0.spacing = 10
        $0.alignment = .fill
        $0.distribution = .fillEqually
        $0.backgroundColor = .systemGray6
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIStackView())
    
    lazy var scrollViewContent: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .systemGray6
        $0.addSubviews(topImage, priceLabel, modelLabel, hStack, bigDataLabel)
        return $0
    }(UIView())
    
    lazy var favoritesButton = ButtonView(text: "В избранное", color: .white, textColor: .black, const: true)
    lazy var buyButton  = ButtonView(text: "Купить", const: true)

    init(numPage: Int){
        self.numPage = numPage
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        setContent()
        view.addSubview(scrollView)
        setupConstraint()
    }
    
    func setContent() {
        let content = data[numPage]
        topImage.image = UIImage(named: content.image)
        priceLabel.text = content.price
        modelLabel.text = content.model + content.data
        hStack.addArrangedSubview(favoritesButton)
        hStack.addArrangedSubview(buyButton)
        bigDataLabel.text = content.bigData
        
    }

    func setupConstraint() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor),

            scrollViewContent.topAnchor.constraint(equalTo: scrollView.topAnchor),
            scrollViewContent.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            scrollViewContent.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            scrollViewContent.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            scrollViewContent.widthAnchor.constraint(equalTo: scrollView.widthAnchor),

            topImage.topAnchor.constraint(equalTo: scrollViewContent.topAnchor),
            topImage.leadingAnchor.constraint(equalTo: scrollViewContent.leadingAnchor),
            topImage.trailingAnchor.constraint(equalTo: scrollViewContent.trailingAnchor),
            topImage.heightAnchor.constraint(equalToConstant: 250),
            
            priceLabel.topAnchor.constraint(equalTo: topImage.bottomAnchor, constant: leftIndent),
            priceLabel.leadingAnchor.constraint(equalTo: scrollViewContent.leadingAnchor, constant: leftIndent),
            priceLabel.trailingAnchor.constraint(equalTo: scrollViewContent.trailingAnchor, constant: -leftIndent),
            priceLabel.heightAnchor.constraint(equalToConstant: 42),
            
            modelLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor),
            modelLabel.leadingAnchor.constraint(equalTo: scrollViewContent.leadingAnchor, constant: leftIndent),
            modelLabel.trailingAnchor.constraint(equalTo: scrollViewContent.trailingAnchor, constant: -leftIndent),
            modelLabel.heightAnchor.constraint(equalToConstant: 23),
            
            hStack.topAnchor.constraint(equalTo: modelLabel.bottomAnchor, constant: leftIndent),
            hStack.leadingAnchor.constraint(equalTo: scrollViewContent.leadingAnchor, constant: leftIndent),
            hStack.trailingAnchor.constraint(equalTo: scrollViewContent.trailingAnchor, constant: -leftIndent),
            hStack.heightAnchor.constraint(equalToConstant: 42),
            
            bigDataLabel.topAnchor.constraint(equalTo: hStack.bottomAnchor, constant: leftIndent),
            bigDataLabel.leadingAnchor.constraint(equalTo: scrollViewContent.leadingAnchor, constant: leftIndent),
            bigDataLabel.trailingAnchor.constraint(equalTo: scrollViewContent.trailingAnchor, constant: -leftIndent),
            bigDataLabel.bottomAnchor.constraint(equalTo: scrollViewContent.bottomAnchor, constant: -leftIndent)
        ])
    }
}
