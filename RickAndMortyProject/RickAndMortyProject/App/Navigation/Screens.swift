//
//  Screens.swift
//  RickAndMortyProject
//
//  Created by Lau on 28/05/2021.
//

import UIKit

class Screens {
    
    func createHomeViewController(delegate: HomeViewModelDelegate?) -> UIViewController {
        let viewController = HomeViewController()
        let viewModel = HomeViewModel(delegate: delegate)
        viewController.viewModel = viewModel
        return viewController
    }
    

}
