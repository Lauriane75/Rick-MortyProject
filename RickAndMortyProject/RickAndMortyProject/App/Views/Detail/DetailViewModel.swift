//
//  DetailViewModel.swift
//  RickAndMortyProject
//
//  Created by Lau on 03/06/2021.
//

import Foundation

protocol DetailViewModelDelegate: AnyObject {

}

final class DetailViewModel {
    
    // MARK: - Properties
    
    let characterItem: CharacterItem
    
    private weak var delegate: DetailViewModelDelegate?
    
    // MARK: - Initializer
    
    init(delegate: DetailViewModelDelegate?, characterItem: CharacterItem) {
        self.delegate = delegate
        self.characterItem = characterItem
    }
    
    // MARK: - Output
    
    var visibleCharacterItem: ((CharacterItem) -> Void)?
    
    // MARK: - Input
    
    func viewDidLoad() {
        visibleCharacterItem?(characterItem)
    }
    
}

