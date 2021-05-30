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
        
    var viewModel: HomeViewModel!
    
    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bind(to: viewModel)
        
        viewModel.viewDidLoad()
        
        view.backgroundColor = .blue
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        viewModel.viewWillAppear()
    }
    
    // MARK: - Action
    
    // MARK: - Private Functions
    
    fileprivate func bind(to viewModel: HomeViewModel) {
        
    }
    
}
