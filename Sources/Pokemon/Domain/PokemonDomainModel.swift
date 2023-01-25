//
//  File.swift
//  
//
//  Created by nexsoft nexsoft on 25/01/23.
//

import Foundation

public struct PokemonDomainModel: Identifiable {
    public let id: Int?
    public let attack, defense: Int?
    public let description: String?
    public let height : Int?
    public let imageURL: String?
    public let name, type: String?
    public let weight: Int?
}
