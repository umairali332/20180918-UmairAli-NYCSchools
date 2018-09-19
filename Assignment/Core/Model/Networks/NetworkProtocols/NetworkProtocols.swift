//
//  NetworkProtocols.swift
//  StarzPlayAssignment
//
//  Created by Umair Ali on 4/8/18.
//  Copyright © 2018 Umair Ali. All rights reserved.
//

protocol Routable {
    
    typealias Parameters = Dictionary<String, Any>
    var route : String { get set }
    init()
}


extension Routable {
    
    init() {
        
        self.init()
    }
}


protocol Readable : Routable {
    
}

protocol Creatable : Routable {
    
}

protocol Updatable : Routable {
    
}

protocol Deletable : Routable {
    
}


// Extensions

extension Readable {
    
    static func get( parameters : Parameters? ) -> RequestConverter {
        
        let temp = Self.init()
        return RequestConverter(method: .get, route: temp.route, parameters: parameters)
    }
    
}

extension Creatable {
    
    static func create( parameters : Parameters? ) -> RequestConverter {
        
        let temp = Self.init()
        return RequestConverter(method: .post, route: temp.route, parameters: parameters)
    }
}

extension Updatable {
    
    static func update( parameters : Parameters? ) -> RequestConverter {
        
        let temp = Self.init()
        return RequestConverter(method: .put, route: temp.route, parameters: parameters)
    }
}

extension Deletable {
    
    static func delete( parameters : Parameters? ) -> RequestConverter {
        
        let temp = Self.init()
        return RequestConverter(method: .delete, route: temp.route, parameters: parameters)
    }
}


