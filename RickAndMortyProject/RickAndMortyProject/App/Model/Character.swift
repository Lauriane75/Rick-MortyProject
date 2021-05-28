//
//  Character.swift
//  RickAndMortyProject
//
//  Created by Lau on 28/05/2021.
//

import Foundation

// MARK: - Character
struct Character: Decodable {
    let info: Info?
    let results: [Results?]
}

// MARK: - Info
struct Info: Decodable {
    let count: Int?
    let pages: Int?
    let next: String?
    let prev: String?
}

// MARK: - Result
struct Results: Decodable {
    let id: Int
    let name: String
    let type: String
    let image: String
    let episode: [String]
    let url: String
    let created: String
}

// MARK: - CharacterItem

struct CharacterItem: Equatable {
    let id: String?
    let name: String?
    let type: String?
    let image: String?
    let url: String?
    let created: String?
}

extension CharacterItem {
    init(results: Results) {
        self.id = "\(results.id)"
        self.name = "\(results.name)"
        self.type = "\(results.type)"
        self.image = "\(results.image)"
        self.url = "\(results.url)"
        self.created = "\(results.image)"
    }
}
