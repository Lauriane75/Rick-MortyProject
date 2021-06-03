//
//  Repository.swift
//  RickAndMortyProject
//
//  Created by Lau on 28/05/2021.
//

import Foundation

protocol RepositoryType: AnyObject {
    func getCharacterList(completion: @escaping (CompletionResult<Character>) -> Void, error: @escaping (String) -> Void)
}

class Repository: RepositoryType {
    
    private let token = Token()
    private let context: Context
    
    private let initialURL = "https://rickandmortyapi.com/api/"
    
    var urlCharacter: String {
        return initialURL + "character/"
    }
    
    // MARK: - Initializer
    
    init(context: Context) {
        self.context = context
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
    
    func getCharacterList(completion: @escaping (CompletionResult<Character>) -> Void, error: @escaping (String) -> Void) {
        
        let urlString = "https://rickandmortyapi.com/api/character/"
        
        guard let url = URL(string: urlString) else { return }
        
        context.client.request(type: Character.self, endPointType: .GET, url: url, cancelledBy: token) { character in
            switch character {
            case .success(value: let characterItem):
                let result: Character = characterItem
                completion(.success(value: result))
            case .failure(error: let onError):
                error(onError.localizedDescription)
                print("error = \(String(describing: error))")
            }
        }
    }
    
}
