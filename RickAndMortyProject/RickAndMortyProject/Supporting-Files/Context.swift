//
//  Context.swift
//  RickAndMortyProject
//
//  Created by Lau on 28/05/2021.
//

import Foundation

final class Context {

    let client: HTTPClientType

    init(client: HTTPClientType) {
        self.client = client
    }
}

