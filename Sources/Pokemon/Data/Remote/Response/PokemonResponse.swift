//
//  File.swift
//  
//
//  Created by nexsoft nexsoft on 18/01/23.
//

import Foundation

public struct PokemonModelResponse: Codable {
    public let id: Int?
    public let attack, defense: Int?
    public let description: String?
    public let height : Int?
    public let imageURL: String?
    public let name, type: String?
    public let weight: Int?

    enum CodingKeys: String, CodingKey {
        case attack, defense
        case description = "description"
        case height, id
        case imageURL = "imageUrl"
        case name, type, weight
    }
}


public typealias PokemonResponse = [PokemonModelResponse?]
