//
//  LoginResponse.swift
//  BVDAPP
//
//  Created by khushbu on 04/06/25.
//

import Foundation

struct User: Codable,Equatable {
    let token_type: String
    let expires_in: Int
    let access_token: String
    let refresh_token: String
    let user_id:Int
    let first_name:String
    let last_name:String
    let email:String
    let phone:String
    let term_accepted:Int
    let twofactor_accepted:Int
}
