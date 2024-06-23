//
//  BVDAPPApp.swift
//  BVDAPP
//
//  Created by khushbu on 04/06/25.
//


import Foundation

protocol URLEndpoint {
    var scheme: String { get }
    var host: String { get }
    var port:Int { get }
    var path: String { get }
    var queryItems: [URLQueryItem]? { get }
    func url() -> URL?
}

extension URLEndpoint {
    var scheme: String { return "https" }
    var host: String { return "portal.bvdpetroleum.com" }
    var queryItems: [URLQueryItem]? { return nil }
    var port:Int {return 82}
   
    func url() -> URL? {
        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        components.port = port
        components.path = "\(path)"
        components.queryItems = queryItems
        return components.url
        
    }
}

