//
//  File.swift
//  
//
//

public protocol Endpoint {
    var path:              String { get }
    var method:        HTTPMethod { get }
    var parameters: [String: Any] { get }
    var headers: [String: String] { get }
}

public extension Endpoint {
    var headers: [String: String] { [:] }
    var parameters: [String: Any] { [:] }
    var url: String { "\(path)" }
}
