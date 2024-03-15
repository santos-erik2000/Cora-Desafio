//
//  Token.swift
//  CoraDesafio
//
//  Created by Erik Santos on 15/03/24.
//

import Foundation

public struct Token: Codable {
    
    enum CodingKeys: String, CodingKey {
        case token = "token"
    }

    public let token: String
}
