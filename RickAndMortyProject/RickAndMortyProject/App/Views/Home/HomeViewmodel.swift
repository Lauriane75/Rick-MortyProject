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
            
        }
    }
    // MARK: - Initializer
    
    init(delegate: HomeViewModelDelegate?, repository: RepositoryType) {
        self.delegate = delegate
        self.repository = repository
    }
    
    // MARK: - Output
    
    var labelText: ((String) -> Void)?
    
    // MARK: - Input
    
    func viewDidLoad() {
        
        repository.getCharacterList { [self] result in
            switch result {
            case .success(value: let characterItem):
                characterItem.results.enumerated().forEach { _, item in
                    self.characterItems.append(CharacterItem(results: item!))
                }
                print("characterItems = \(self.characterItems[1].name ?? "name")")
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

