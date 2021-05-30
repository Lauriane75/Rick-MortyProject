//
//  ViewController.swift
//  RickAndMortyProject
//
//  Created by Lau on 27/05/2021.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - Outlets
    
    // MARK: - Properties
    
    var visibleCharacter: [CharacterItem] = []
    
    var viewModel: HomeViewModel!
    
    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bind(to: viewModel)
        
        view.backgroundColor = .blue
        Repository().getCharacter { result in
            switch result {
            case .success(let characters):
                guard let allResults = characters.first?.results else { return }
                
                allResults.enumerated().forEach { index, item in
                    self.visibleCharacter.append(CharacterItem(results: item!))
                }
                print("visibleCharacter \(self.visibleCharacter)")
                
            case .failure(let error):
                print("error = \(error.localizedDescription)")
            }
        }
    }
    
    
    // MARK: - Action
    
    // MARK: - Private Functions
    
    fileprivate func bind(to viewModel: HomeViewModel) {
        
    }
    
}
