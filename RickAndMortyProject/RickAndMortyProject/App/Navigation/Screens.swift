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
