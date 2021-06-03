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
        
    private let repository: RepositoryType
    
    private weak var delegate: HomeViewModelDelegate?
        
    private var characterItems: [CharacterItem] = [] {
        didSet {
            DispatchQueue.main.async {
                self.visiblecharacterItem?(self.characterItems)
            }
        }
    }
    // MARK: - Initializer
    
    init(delegate: HomeViewModelDelegate?, repository: RepositoryType) {
        self.delegate = delegate
        self.repository = repository
    }
    
    // MARK: - Output
        
    var visiblecharacterItem: (([CharacterItem]) -> Void)?
    
    // MARK: - Input
    
    func viewDidLoad() {
        
        repository.getCharacterList { result in
            switch result {
            case .success(value: let characterList):
                self.characterItems = characterList.results.map { result in
                    CharacterItem(results: result!)
                }
            case .failure(error: let error):
                print("error = \(error.localizedDescription)")
            }
        } error: { _ in
            print("Call database")
        }
    }
    
    func viewWillAppear() {
   
    }
    
    func didPressButton() {
        delegate?.showDetailView()
    }
    
}

