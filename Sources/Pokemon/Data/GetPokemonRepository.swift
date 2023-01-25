//
//  File.swift
//  
//
//  Created by nexsoft nexsoft on18/01/23.
//

import Foundation
import Combine
import Core

public struct GetPokemonRepository <
    PokemonLocaleDataSource: LocaleDataSource,
    RemoteDataSource: DataSource,
    Transformer: Mapper>: Repository
where
PokemonLocaleDataSource.Response == Any,
RemoteDataSource.Response == PokemonResponse,
Transformer.Response == PokemonResponse,
Transformer.Entity == Any,
Transformer.Domain == [PokemonDomainModel] {
    
    public typealias Request = Any
    public typealias Response = [PokemonDomainModel]
    
    private let _localeDataSource: PokemonLocaleDataSource
    private let _remoteDataSource: RemoteDataSource
    private let _mapper: Transformer
    
    public init(
        localeDataSource: PokemonLocaleDataSource,
        remoteDataSource: RemoteDataSource,
        mapper: Transformer) {
        
        _localeDataSource = localeDataSource
        _remoteDataSource = remoteDataSource
        _mapper = mapper
    }
    
    public func execute(request: Request?) -> AnyPublisher<[PokemonDomainModel], Error> {
        return _remoteDataSource.execute(request: request as? RemoteDataSource.Request)
            .map { response in
                _mapper.transformResponseToEntity(response: response) as! [PokemonDomainModel]
//                PokemonMapper.mapPokemonResponsesToDomains(input: response)
            }
            .eraseToAnyPublisher()
    }
   
    
}
