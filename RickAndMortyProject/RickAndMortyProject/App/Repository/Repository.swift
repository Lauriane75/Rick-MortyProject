//
//  Repository.swift
//  RickAndMortyProject
//
//  Created by Lau on 28/05/2021.
//

import Foundation

class Repository {
    
    private let initialURL = "https://rickandmortyapi.com/api/"
    
    var urlCharacter: String {
        return initialURL + "character/"
    }
    
    func getCharacter(completion: @escaping(Result<[Character], Error>) -> Void) {
        
        let urlString = "https://rickandmortyapi.com/api/character/"
        
        guard let url = URL(string: urlString) else { print("invalid URL"); return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil else { print("Error = \(String(describing: error?.localizedDescription))"); return }
            guard data != nil else { return }
            do {
                let result = try JSONDecoder().decode(Character.self, from: data!)
                completion(.success([result]))
            } catch {
                completion(.failure(error.localizedDescription as! Error))
            }
        }.resume()
    }
}
