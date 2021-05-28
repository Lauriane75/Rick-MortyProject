//
//  HomeViewmodel.swift
//  RickAndMortyProject
//
//  Created by Lau on 28/05/2021.
//

import Foundation

protocol HomeViewModelDelegate: AnyObject {
    func showDetailView()
}

final class HomeViewModel {
    
    // MARK: - Properties
    
    private weak var delegate: HomeViewModelDelegate?
        
    // MARK: - Initializer
    
    init(delegate: HomeViewModelDelegate?) {
        self.delegate = delegate
    }
    
    // MARK: - Output
    
    var labelText: ((String) -> Void)?
    
    // MARK: - Input
    
    func didPressButton() {
        delegate?.showDetailView()
    }
    
}

