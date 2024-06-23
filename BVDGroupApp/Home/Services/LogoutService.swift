//
//  LogoutService.swift
//  BVDGroupApp
//
//  Created by khushbu on 07/06/24.
//

import Foundation

protocol LogoutService {
    func logoutServiceRequest(header:String) async -> Result<LogoutResponse, Error>?
}
