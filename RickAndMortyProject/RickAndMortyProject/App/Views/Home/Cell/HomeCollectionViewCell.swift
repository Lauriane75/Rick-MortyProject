//
//  HomeCollectionViewCell.swift
//  RickAndMortyProject
//
//  Created by Lau on 30/05/2021.
//

import UIKit

final class HomeCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Outlet
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    // MARK: - Initializer

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Configure
    
    func configure(with visibleImage: String) {
        imageView.loadImage(url: URL(string: visibleImage)!)
    }
    
//    func configure(with visibleCharacterItem: CharacterItem) {
//
//    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = contentView.bounds
    }

}
