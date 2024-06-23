//
//  LogoutResponse.swift
//  BVDGroupApp
//
//  Created by khushbu on 07/06/24.
//

import Foundation


 struct LogoutResponse: Codable {
    let code: Int
    let message: String
    let error: Bool
}
