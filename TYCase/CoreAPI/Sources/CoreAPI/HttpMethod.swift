//
//  File.swift
//  
//
//

import Alamofire

public typealias HTTPMethod = Alamofire.HTTPMethod

public extension Endpoint {
    var encoding: ParameterEncoding { URLEncoding.default } 
}
