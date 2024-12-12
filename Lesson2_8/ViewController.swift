//
//  ViewController.swift
//  Lesson2_8
//
//  Created by Evgeny Mastepan on 10.12.2024.
//

import UIKit

class ViewController: UIViewController {
    let leftIndent: CGFloat = 15
    let data = Card.cards
    
    lazy var layout: UICollectionViewFlowLayout = {
        $0.scrollDirection = .vertical
        $0.minimumLineSpacing = leftIndent
        $0.minimumInteritemSpacing = 0
        $0.itemSize = CGSize(width: view.frame.width / 2 - 25, height: 300)
        return $0
    }(UICollectionViewFlowLayout())
    
    lazy var collectionView: UICollectionView = {
        $0.showsVerticalScrollIndicator = false
        $0.contentInset = UIEdgeInsets(top: leftIndent, left: leftIndent, bottom: leftIndent, right: leftIndent)
        $0.dataSource = self
        $0.delegate = self
        $0.register(CellView.self, forCellWithReuseIdentifier: CellView.identifier)
        return $0
    }(UICollectionView(frame: view.frame, collectionViewLayout: layout))
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray5
        view.addSubview(collectionView)
    }


}

