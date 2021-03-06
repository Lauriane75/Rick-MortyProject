//
//  HomeCoordinator.swift
//  RickAndMortyProject
//
//  Created by Lau on 28/05/2021.
//

import UIKit

class HomeViewCoordinator {
    
    // MARK: - Properties
    
    private let screens: Screens
    
    private let navigationController: UINavigationController
    
    // MARK: - Initializer
    
    init(screens: Screens, navigationController: UINavigationController) {
        self.screens = screens
        self.navigationController = navigationController
    }
}

// MARK: - CoordinatorProtocol

extension HomeViewCoordinator: CoordinatorProtocol {
    
    // MARK: - Start
    
    func start() {
        showHomeView()
    }
    
    // MARK: - Private Functions
    
    private func showHomeView() {
        let viewController = screens.createHomeViewController(delegate: self)
        navigationController.pushViewController(viewController, animated: false)
    }
    
    private func createDetailView(characterItem: CharacterItem) {
        let viewController = screens.createDetailViewController(delegate: self, characterItem: characterItem)
        navigationController.pushViewController(viewController, animated: false)
    }
}

extension HomeViewCoordinator: HomeViewModelDelegate {
    func didSelectCharacter(item: CharacterItem) {
        createDetailView(characterItem: item)
    }
}

extension HomeViewCoordinator: DetailViewModelDelegate {
   
}

