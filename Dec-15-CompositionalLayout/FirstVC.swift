//
//  ViewController.swift
//  Dec-15-CompositionalLayout
//
//  Created by Admin on 15/12/22.
//

import UIKit

class FirstVC: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    let paddingLeftRight: CGFloat = 5
    let interItemSpacing: CGFloat = 5
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
    
    func setupCollectionView() {
        
        let smallItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1/2))
        let smallItem = NSCollectionLayoutItem(layoutSize: smallItemSize)
        
        
        
        
        let mediumItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/2), heightDimension: .fractionalHeight(1))
        let mediumItem = NSCollectionLayoutItem(layoutSize: mediumItemSize)
        
        
        
        
        let largeItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1/2))
        let largeItem = NSCollectionLayoutItem(layoutSize: largeItemSize)
        
        
        
        
        
        
        let vertGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/6), heightDimension: .fractionalHeight(1))
        let vertGroup = NSCollectionLayoutGroup.vertical(layoutSize: vertGroupSize, subitems: [smallItem, smallItem])
        
        
        
        
        
        
        let smallHorGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/2), heightDimension: .fractionalHeight(1))
        let smallHorGroup = NSCollectionLayoutGroup.horizontal(layoutSize: smallHorGroupSize, subitems: [mediumItem, mediumItem])
        
        
        
        
        
        let largeHorGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1/2))
        let largeHorGroup = NSCollectionLayoutGroup.horizontal(layoutSize: largeHorGroupSize, subitems: [vertGroup, vertGroup, vertGroup, smallHorGroup])
        
        
        
        
        let outerGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(1))
        let outerGroup = NSCollectionLayoutGroup.vertical(layoutSize: outerGroupSize, subitems: [largeItem, largeHorGroup])
        
        
        
        let section = NSCollectionLayoutSection(group: outerGroup)
        
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        

        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.collectionViewLayout = layout
        
        let collectionNib = UINib(nibName: Constants.CollectionViewCellNib, bundle: nil)
        collectionView.register(collectionNib, forCellWithReuseIdentifier: Constants.nibCell)
    }
}

extension FirstVC: UICollectionViewDelegate {
    
}

extension FirstVC: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Data.list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.nibCell, for: indexPath) as! CollectionViewCellNib
        
        cell.img.image = UIImage(named: Data.list[indexPath.row].img)
        cell.label.text = Data.list[indexPath.row].label
        
        return cell
        
    }
}



