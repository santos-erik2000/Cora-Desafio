//
//  ExtractResponse.swift
//  NetwokKit
//
//  Created by Erik Santos on 15/03/24.
//

import Foundation

public struct ExtractResponse: Decodable {
    public let results: [ExtractResultResponse]
    public let itemsTotal: Int
}

public struct ExtractResultResponse: Decodable {
    public let items: [ExtractItemResponse]
    public let date: String
}

public struct ExtractItemResponse: Decodable {
    public let id: String
    public let description: String
    public let label: String
    public let entry: String
    public let amount: Int
    public let name: String
    public let dateEvent: String
    public let status: String
}
