//
//  BVDAPPApp.swift
//  BVDAPP
//
//  Created by khushbu on 04/06/25.
//

import Foundation
import Combine


let validStatus = 200...299

protocol HttpClient {
    func fetchHttpData<T: Decodable>(from url: URL, method: String, body: Any?, responseType: T.Type) async -> Result<T, Error>
}

class NetworkClient: HttpClient {
    static let shared = NetworkClient()
    
    private var authToken: String? {
        get {
            if let savedUserData = UserDefaults.standard.data(forKey: "userDetails") {
                let decoder = JSONDecoder()
                if let loadedUser = try? decoder.decode(User.self, from: savedUserData) {
                    return loadedUser.access_token
                }
            }
            return nil
        }
        
    }
    
    func fetchHttpData<T: Decodable>(from url: URL, method: String, body: Any?, responseType: T.Type) async -> Result<T, Error> {
        do {
           // Create post request
            var request = URLRequest(url: url)
            request.httpMethod = method
            
            // HTTP Headers
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            
            if authToken != nil {
                request.addValue("Bearer \(authToken!)",forHTTPHeaderField: "Authorization")
            }
            if body != nil {
                let bodyData = try JSONSerialization.data(withJSONObject: body!, options: .prettyPrinted)
                request.httpBody = bodyData
            }
           // print(request)
            let (data, response) = try await URLSession.shared.data(for: request)
           // print(response)
            
            guard let httpResponse = response as? HTTPURLResponse else {
                return .failure(URLError(.badServerResponse))
            }
            if httpResponse.statusCode == 401 {
                return .failure(URLError(.badServerResponse))
                //Logout code
            }
            
            guard (200...299).contains(httpResponse.statusCode) else {
                return .failure(URLError(.badServerResponse))
            }
            
            let responseData = try JSONDecoder().decode(T.self, from: data)
            return .success(responseData)
        } catch {
            return .failure(error)
        }
    }
    
}




