//
//  LoginRequest.swift
//  CoreKit
//
//  Created by Erik Santos on 14/03/24.
//

import Foundation

public struct LoginRequest: Encodable {
    public let document: String
    public let password: String
    
    public init(document: String, password: String) {
        self.document = document
        self.password = password
    }
}
