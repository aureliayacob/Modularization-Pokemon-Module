//
//  File.swift
//  
//
//  Created by nexsoft nexsoft on 18/01/23.
//

import Core
import Combine
import Foundation


public struct GetPokemonRemoteDataSource: DataSource {
    
    public typealias Request = Any
    
    public typealias Response = PokemonResponse
    
    private let _endpoint: String
    
    public init(endpoint: String) {
        _endpoint = endpoint
    }
    
    public func execute(request: Request?) -> AnyPublisher<PokemonResponse, Error> {
        URLSession.shared.dataTaskPublisher(for: URL(string:"https://pokedex-bb36f.firebaseio.com/pokemon.json")!)
            .subscribe(on: DispatchQueue.global(qos: .default))
            .tryMap({ $0.data })
            .receive(on: DispatchQueue.main)
            .decode(type: PokemonResponse.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
