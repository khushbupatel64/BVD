//
//  LoginService.swift
//  BVDAPP
//
//  Created by khushbu on 04/06/25.
//

import Foundation
import Combine


protocol LoginService {
    func Login(loginRequest:LoginRequest) async -> Result<User, Error>?
}
