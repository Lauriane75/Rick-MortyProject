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
        
    private let collectionView: CustomCollectionView
    
    // MARK: - Properties
    
    var viewModel: HomeViewModel!
    
    private var homeCollectionViewDataSource = HomeCollectionViewDataSource()
    
    // MARK: - View life cycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        self.collectionView = CustomCollectionView(frame: .zero, collectionViewLayout: HomeViewController.createLayout())
                
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
        
        collectionView.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: "HomeCollectionViewCell")
        collectionView.frame = view.bounds
        collectionView.backgroundColor = .white
        collectionView.dataSource = homeCollectionViewDataSource
        collectionView.delegate = homeCollectionViewDataSource
        
        setElementaddSubview()
        
        createElementsConstraints()
        
        bind(to: viewModel)
        
        viewModel.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        viewModel.viewWillAppear()
        
        bind(to: homeCollectionViewDataSource)
    }
    
    // MARK: - Action
    
    // MARK: - Private Functions
    
    fileprivate func bind(to viewModel: HomeViewModel) {
        viewModel.visiblecharacterItem = { [weak self] characterItem in
            guard let self = self else { return }
            self.homeCollectionViewDataSource.update(with: characterItem)
            self.collectionView.reloadData()
        }
    }
    
    fileprivate func bind(to source: HomeCollectionViewDataSource) {
        source.selectedCharacter = viewModel.didSelectCharacterInList
    }
    
    fileprivate func setElementaddSubview() {
        view.addSubview(collectionView)
        
    }
    
    fileprivate func createElementsConstraints() {
       
        
    }
    
    static func createLayout() -> UICollectionViewCompositionalLayout {
        // item
        let item = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(2/3),
                heightDimension: .fractionalHeight(1)
            )
        )
        
        item.contentInsets = NSDirectionalEdgeInsets(
            top: 2, leading: 2, bottom: 2, trailing: 2
        )
        
        let verticalStackItem = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalWidth(0.5)
            )
        )
        verticalStackItem.contentInsets = NSDirectionalEdgeInsets(
            top: 2, leading: 2, bottom: 2, trailing: 2)
        
        let verticalStackGroup = NSCollectionLayoutGroup.vertical(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1/3),
                heightDimension: .fractionalHeight(1)),
            subitem: verticalStackItem,
            count: 2)
        
        let tripletItem = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(
                                                    widthDimension: .fractionalWidth(1/3),
                                                    heightDimension: .absolute(100)))
        
        
        let tripleHorizontalGroup = NSCollectionLayoutGroup.horizontal(
            layoutSize:  NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .fractionalWidth(1/3)),
            subitem: tripletItem,
            count: 3
        )
        
        // group
        let horizontalGroup = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .fractionalHeight(2/3)
            ),
            subitems: [
                item,
                verticalStackGroup
            ]
        )
        
        let verticalGroup = NSCollectionLayoutGroup.vertical(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .fractionalHeight(3/5)
            ),
            subitems: [horizontalGroup, tripleHorizontalGroup]
        )
        
        // sections
        let section = NSCollectionLayoutSection(group: verticalGroup)
        
        // return
        return UICollectionViewCompositionalLayout(section: section)
    }
    
}
