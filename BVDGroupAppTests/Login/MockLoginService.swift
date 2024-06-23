//
//  MockLoginService.swift
//  BVDGroupAppTests
//
//  Created by khushbu on 17/06/24.
//

import XCTest
@testable import BVDGroupApp

class MockLoginService: LoginService {
    var loginResponse: Result<User, Error>?
    
    func Login(loginRequest: LoginRequest) async -> Result<User,Error>? {
        return loginResponse
    }
}




