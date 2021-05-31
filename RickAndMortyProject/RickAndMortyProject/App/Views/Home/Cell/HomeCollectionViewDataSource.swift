//
//  HomeCollectionViewDataSource.swift
//  RickAndMortyProject
//
//  Created by Lau on 30/05/2021.
//

import UIKit

class HomeCollectionViewDataSource: NSObject, UICollectionViewDataSource {
    
    // MARK: Private properties
    
    private var images: [String] = []
    
    //    private var items: [CharacterItem] = []
    
    // MARK: Public function
    
    func update(with images: [String]) {
        self.images = images
    }
    
    //    func update(with items: [CharacterItem]) {
    //        self.items = items
    //    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard images.count > indexPath.item else {
            return UICollectionViewCell() // Should be monitored
        }
        let visibleImage = images[indexPath.item]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell",
                                                      for: indexPath)
            as! HomeCollectionViewCell
        cell.configure(with: visibleImage)
        return cell
    }
}

