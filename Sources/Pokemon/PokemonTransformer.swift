//
//  File.swift
//  
//
//  Created by nexsoft nexsoft on 25/01/23.
//

import Foundation
import Core

public struct PokemonTransformer: Mapper {

    public typealias Response = PokemonResponse
    
    public typealias Entity = Any
    
    public typealias Domain = [PokemonDomainModel]
    
    public init() {}
    
    public func transformResponseToEntity(response: PokemonResponse) -> Entity {
        fatalError()
    }
    
    public func transformEntityToDomain(entity: Entity) -> [PokemonDomainModel] {
        return (entity as! [PokemonModelResponse])
            .compactMap({$0})
            .map { result in
                return PokemonDomainModel(id: result.id, attack: result.attack, defense: result.defense, description: result.description
                                , height: result.height, imageURL: result.imageURL, name: result.name, type: result.type, weight: result.weight)
            
            
        }
    }
    
}

