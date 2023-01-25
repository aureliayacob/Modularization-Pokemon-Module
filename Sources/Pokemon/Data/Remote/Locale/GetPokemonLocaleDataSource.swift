//
//  File.swift
//  
//
//  Created by nexsoft nexsoft on 25/01/23.
//

import Foundation
import Core
import Combine


public struct GetCategoriesLocaleDataSource: LocaleDataSource {
    
    public typealias Request = Any
    
    public typealias Response = Any
    
    private let _manager: Any
    
    public init(manager: Any) {
          _manager = manager
    }
    
    public func list(request: Request?) -> AnyPublisher<[Response], Error> {
        fatalError()
    }
    
    public func add(entities: [Response]) -> AnyPublisher<Bool, Error> {
        fatalError()
    }
    
    public func get(id: String) -> AnyPublisher<Response, Error> {
        fatalError()
    }
    
    public func update(id: Int, entity: Response) -> AnyPublisher<Bool, Error> {
        fatalError()
    }
    
    
}
