//
//  LoginViewModelTests.swift
//  BVDGroupAppTests
//
//  Created by khushbu on 17/06/24.


import Foundation
import XCTest

@testable import BVDGroupApp

final class LoginViewModelTests: XCTestCase {
    
    var viewModel: LoginViewModel!
    var mockLoginService: MockLoginService!
    
    override func setUp() {
        super.setUp()
        mockLoginService = MockLoginService()
        viewModel = LoginViewModel(client:mockLoginService)
    }
    
    override func tearDown() {
       
    super.tearDown()
        viewModel = nil
        mockLoginService = nil
    }
    
    func testInitialState() {
        XCTAssertEqual(viewModel.username, "")
        XCTAssertEqual(viewModel.password, "")
        XCTAssertEqual(viewModel.state, .none)
    }
    
    func testLoginSuccess() async {
       let user = LoginRequest(username: "testapp1", password:"Testapp1@123")
        mockLoginService.loginResponse = .success(User(token_type: "Bearer", expires_in: 86400, access_token: "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIyIiwianRpIjoiODljZTQ1OGI5OTdlN2VlY2M2OTJhN2FlMzRkNjJlMzBkNzIzNjUzMzg3Zjk3ZWJkM2I4OWEzM2Y5YzgxNzE3MzliZDVhMjg0NTFkYzBiODMiLCJpYXQiOjE3MTg2Njc4MTYuNDMxNTYzLCJuYmYiOjE3MTg2Njc4MTYuNDMxNTY2LCJleHAiOjE3MTg3NTQyMTYuNDI3MTI4LCJzdWIiOiIxMDgyNSIsInNjb3BlcyI6W119.FpYBBp3akfW79jf5k09HgDkYMBycQFUnMPTMxi2Umq_dKxadTfyGu7gEqAroY_H0-gtQxAQgt8T5lSUgVEVLiw", refresh_token: "def50200e59a2d3c18d67015b742e60b707d761f7e5c5c39cb03cccd6061357bd39a3dafa9df5f262695efb3bc640e9bbca54a3051729aca16720842f51d5710e221bcb4e739ba5927cdf9ea94aceb0768453025437d792f38d12f69c37772b8c592cf8b1480ad4e6f0ba7122ae5516fe9c8951c8733e06da7408132b46eb7af5cdeefd62eca0f6fbbc10e1d3a418d7af373d0da33c38fc21d9befba444379648c7a5ac43c4e85d940b6ff1c954a49cdb567599704c0796092a44657110ea7dc467608f4dbcd47410d2d1bc69422a095373573a6f542b6ed7f89f645a3607bf1737774c690c71b33582366448bedee65c6df491cf485d114239770d3ce82de84ef1e115bfee684959493c14378ec26501ac0b8cca278fdd011ecb0ee5851ceb13eea8de7b9178f526943969d1e728a56e5bac3d4a600ad6cbf95e475a5049e0327ca49c723f663c192ec15de7c161be9e7aba004acdafc448becd83517778c6a7786abe521", user_id: 10825, first_name: "Test New", last_name: "app", email: "testapp1@gmail.com", phone: "+11111111111", term_accepted: 0, twofactor_accepted: 0))
        
        
        let result = await viewModel.login()
        XCTAssertTrue(result.0)
        XCTAssertNil(result.1)
        XCTAssertEqual(viewModel.state, .loaded)
        
        let userData = UserDefaults.standard.data(forKey: "userDetails")
        XCTAssertNotNil(userData)
        
        let isAuthenticated = UserDefaults.standard.bool(forKey: "isAuthenticated")
        XCTAssertTrue(isAuthenticated)
    }
    
    func testLoginFailure() async {
       
        let error = NSError(domain: "LoginError", code: 1, userInfo: nil)
        mockLoginService.loginResponse = .failure(error)
        
        let result = await viewModel.login()
        
        XCTAssertFalse(result.0)
        XCTAssertNotNil(result.1)
        XCTAssertEqual(viewModel.state, .error(error))
        
        let userData = UserDefaults.standard.data(forKey: "userDetails")
        XCTAssertNil(userData)
        
        let isAuthenticated = UserDefaults.standard.bool(forKey: "isAuthenticated")
        XCTAssertFalse(isAuthenticated)
    }
    
    
}
