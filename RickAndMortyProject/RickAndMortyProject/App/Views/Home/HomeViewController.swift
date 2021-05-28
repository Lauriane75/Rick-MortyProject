//
//  ViewController.swift
//  RickAndMortyProject
//
//  Created by Lau on 27/05/2021.
//

import UIKit

class HomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        Repository().getCharacter { result in
            switch result {
            case .success(let characters):
                guard let firstPageResults = characters.first?.results.first else { return }
                                                
                let characterItem: [CharacterItem] = characters.map { _ in return CharacterItem(results: firstPageResults!) }
                
                print("name = \(String(describing: characterItem[0].name))")
                
            case .failure(let error):
            print("error = \(error.localizedDescription)")
            }
        }
    }
}
