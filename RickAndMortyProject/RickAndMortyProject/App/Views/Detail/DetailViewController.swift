//
//  DetailViewController.swift
//  RickAndMortyProject
//
//  Created by Lau on 03/06/2021.
//

import UIKit

class DetailViewController: UIViewController {
    
    // MARK: - Outlet

    
    // MARK: - Properties
    
    var viewModel: DetailViewModel!

    // MARK: - Initializer
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        bind(to: viewModel)
        
        viewModel.viewDidLoad()
        
        view.backgroundColor = .purple
    }
    
    // MARK: - Action

    // MARK: - Private Functions
    
    func bind(to viewModel: DetailViewModel) {
        viewModel.visibleCharacterItem = { item in
            print("name = \(String(describing: item.name))")
        }
    }



}
