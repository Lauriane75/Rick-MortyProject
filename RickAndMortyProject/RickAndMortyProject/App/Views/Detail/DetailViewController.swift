//
//  DetailViewController.swift
//  RickAndMortyProject
//
//  Created by Lau on 03/06/2021.
//

import UIKit

class DetailViewController: UIViewController {
    
    // MARK: - Outlet
    
    var stackView = UIStackView()
    
    let nameLabel: CustomLabel
    
    // MARK: - Properties
    
    var viewModel: DetailViewModel!

    // MARK: - Initializer
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        
        nameLabel = CustomLabel(color: .white, textFont: Constant.font.font16)
        
        stackView.addArrangedSubview(nameLabel)
        
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
        
        setElementaddSubview()
        
        createElementsConstraints()
        
        view.backgroundColor = .black
    }
    
    // MARK: - Action

    // MARK: - Private Functions
    
    fileprivate func bind(to viewModel: DetailViewModel) {
        viewModel.visibleCharacterItem = { [weak self] item in
            self?.nameLabel.text = item.name
        }
    }
    
    fileprivate func setElementaddSubview() {
        view.addSubview(nameLabel)
    }
    
    fileprivate func createElementsConstraints() {
        // MARK: - nameLabel constraint
        nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nameLabel.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1).isActive = true
        nameLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
    }

}
