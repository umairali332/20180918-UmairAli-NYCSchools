//
//  NetworkProtocols.swift
//  Assignment
//
//  Created by Umair Ali on 9/18/18.
//  Copyright © 2018 Umair Ali. All rights reserved.
//

public protocol Routable {
    
    typealias Parameters = Dictionary<String, Any>
    var route : String { get set }
    init()
}


public extension Routable {
    
    init() {
        
        self.init()
    }
}


public protocol Readable : Routable {
    
}

public protocol Creatable : Routable {
    
}

public protocol Updatable : Routable {
    
}

public protocol Deletable : Routable {
    
}


// Extensions

public extension Readable {
    
    public static func get( parameters : Parameters? ) -> RequestConverterProtocol {
        
        let temp = Self.init()
        return RequestConverter(method: .get, route: temp.route, parameters: parameters)
    }
    
}

public extension Creatable {
    
    public static func create( parameters : Parameters? ) -> RequestConverterProtocol {
        
        let temp = Self.init()
        return RequestConverter(method: .post, route: temp.route, parameters: parameters)
    }
}

public extension Updatable {
    
    public static func update( parameters : Parameters? ) -> RequestConverterProtocol {
        
        let temp = Self.init()
        return RequestConverter(method: .put, route: temp.route, parameters: parameters)
    }
}

public extension Deletable {
    
    public static func delete( parameters : Parameters? ) -> RequestConverterProtocol {
        
        let temp = Self.init()
        return RequestConverter(method: .delete, route: temp.route, parameters: parameters)
    }
}


