//
//  LogoutHTTPService.swift
//  BVDGroupApp
//
//  Created by khushbu on 07/06/24.
//

import Foundation


class LogOutHTTPService : LogoutService {
    func logoutServiceRequest(header: String) async -> Result<LogoutResponse, any Error>? {
        var result: Result<LogoutResponse, Error>?
        if let url = AppEndPoint.Logout.url() {
            result = await NetworkClient.shared.fetchHttpData(from: url, method: "POST", body: nil, responseType: LogoutResponse.self)
        }
        return result
    }
}
