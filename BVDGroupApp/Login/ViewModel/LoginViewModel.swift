//
//  LoginViewModel.swift
//  BVDAPP
//
//  Created by khushbu on 04/06/25.
//

import Foundation
import SwiftUI

class LoginViewModel: ObservableObject {
    
    //MARK: State Variables
    @Published var username: String = "testapp1"
    @Published var password: String = "Testapp1@123"
    
    let defaults = UserDefaults.standard
    
    @Published private(set) var state = LoadingState.none
    @Published private var errorData: Error?
    
    
    //MARK: Dependencies
    private let client: any LoginService
    
    // MARK: API Calling
    func login() async -> (Bool,Error?) {
        state = .loading
        let loginRequest = LoginRequest(username:username , password: password)
        if let loginResponse = await client.Login(loginRequest: loginRequest) {
            switch loginResponse {
            case .success(let user):
                guard let userDetailData = try? JSONEncoder().encode(user) else { return(false,nil)  }
                defaults.setValue(userDetailData, forKey: "userDetails")
                defaults.setValue(true, forKey: "isAuthenticated")
                state = .loaded
                return (true,nil)
            case .failure(let error):
                state = .error(error)
                return(false,error)
                
            }
        }
        return (false,nil)
    }
    
    //MARK: Initializer
    init(client: any LoginService = LoginHTTPService()) {
        self.client = client
    }
}
