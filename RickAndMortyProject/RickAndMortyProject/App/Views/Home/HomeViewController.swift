//
//  ViewController.swift
//  RickAndMortyProject
//
//  Created by Lau on 27/05/2021.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - Outlets
    
    var stackView = UIStackView()
    
    let titleLabel: CustomLabel
    
    // MARK: - Properties
    
    var viewModel: HomeViewModel!
    
    // MARK: - View life cycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        self.titleLabel = CustomLabel(color: .black, textFont: Constant.font.font16)
        
        stackView.addArrangedSubview(titleLabel)
        
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setElementaddSubview()
        
        createElementsConstraints()
        
        bind(to: viewModel)
        
        viewModel.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        viewModel.viewWillAppear()
    }
    
    // MARK: - Action
    
    // MARK: - Private Functions
    
    fileprivate func bind(to viewModel: HomeViewModel) {
        viewModel.labelText = { [weak self] text in
            self?.titleLabel.text = text
        }
        
    }
    
    fileprivate func setElementaddSubview() {
        view.addSubview(titleLabel)
        
    }
    
    fileprivate func createElementsConstraints() {
        // MARK: - titleLabel
        self.titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 30).isActive = true
        self.titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        self.titleLabel.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1).isActive = true
    }
    
}
