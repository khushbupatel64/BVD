//
//  LoginHTTPService.swift
//  BVDAPP
//
//  Created by khushbu on 04/06/25.
//

import Foundation
import Combine

class LoginHTTPService : LoginService {
    private var cancellables = Set<AnyCancellable>()
    
    func Login(loginRequest:LoginRequest) async -> Result<User, Error>? {
        var result: Result<User, Error>?
        if let url = AppEndPoint.Login(loginRequest:loginRequest).url() {
            result = await NetworkClient.shared.fetchHttpData(from: url, method: "POST", body: loginRequest.convertToDict!, responseType: User.self)
        }
        return result
    }
}
