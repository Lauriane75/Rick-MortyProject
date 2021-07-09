//
//  Screens.swift
//  RickAndMortyProject
//
//  Created by Lau on 28/05/2021.
//

import UIKit

class Screens {
    
    // MARK: - Properties

    private let context: Context
    
    // MARK: - Initializer

    init(context: Context) {
        self.context = context
    }
    
    func createHomeViewController(delegate: HomeViewModelDelegate?) -> UIViewController {
        let viewController = HomeViewController()
        let repository = Repository(context: context)
        let viewModel = HomeViewModel(delegate: delegate, repository: repository)
        viewController.viewModel = viewModel
        return viewController
    }
    
    func createDetailViewController(delegate: DetailViewModelDelegate?, characterItem: CharacterItem) -> UIViewController {
        let viewController = DetailViewController()
        let viewModel = DetailViewModel(delegate: delegate, characterItem: characterItem)
        viewController.viewModel = viewModel
        return viewController
    }
    

}

//Le lorem ipsum est, en imprimerie, une suite de mots sans signification utilisée à titre provisoire pour calibrer une mise en page, le texte définitif venant remplacer le faux-texte dès qu'il est prêt ou que la mise en page est achevée. Généralement, on utilise un texte en faux latin, le Lorem ipsum ou Lipsum.//
