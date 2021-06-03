//
//  Token.swift
//  RickAndMortyProject
//
//  Created by Lau on 28/05/2021.
//

import Foundation

final class Token {

    init() {}

    deinit {
        willDealocate?()
    }

    var willDealocate:(() -> Void)?
}
