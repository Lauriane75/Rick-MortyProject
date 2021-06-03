//
//  HomeCollectionViewDataSource.swift
//  RickAndMortyProject
//
//  Created by Lau on 30/05/2021.
//

import UIKit

class HomeCollectionViewDataSource: NSObject, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    // MARK: Private properties
        
    private var items: [CharacterItem] = []
    
    // MARK: Public function
    
    func update(with items: [CharacterItem]) {
        self.items = items
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard items.count > indexPath.item else {
            return UICollectionViewCell() // Should be monitored
        }
        let visibleCharacter = items[indexPath.item]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell",
                                                      for: indexPath)
            as! HomeCollectionViewCell
        cell.configure(with: visibleCharacter)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Selected Cell: \(indexPath.row)")
    }
}

