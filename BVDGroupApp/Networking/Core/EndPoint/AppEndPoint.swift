//
//  BVDAPPApp.swift
//  BVDAPP
//
//  Created by khushbu on 04/06/25.
//

import Foundation

public enum AppEndPoint: URLEndpoint {
    
    case Login(loginRequest:LoginRequest)
    case getSites(page_length:String,page:String,keyword:String,sorting_field:String,sorting_direction:String)
    case Logout
}
extension AppEndPoint {
    
    var path: String {
        switch self {
        case .Login(loginRequest: _):
            return "/api/verifyUser"
        case .getSites(page_length:_, page: _, keyword: _, sorting_field: _, sorting_direction: _) :
            return "/api/allFuelSites"
        case .Logout :
            return "/api/logout"
        }
    }
    
    var queryItems: [URLQueryItem]? {
        switch self {
        case.Login(loginRequest: _):
            return nil
        case .getSites(page_length:let length, page: let page, keyword: let key, sorting_field: let sortingField, sorting_direction: let sortingDirection) :
            return [URLQueryItem(name: "page_length", value:length),
                    URLQueryItem(name: "page", value: page),
                    URLQueryItem(name: "keyword", value: key),
                    URLQueryItem(name: "sorting_field", value: sortingField),
                    URLQueryItem(name: "sorting_direction", value: sortingDirection)]
            
        case .Logout :
            return nil
        }
    }
    
}
