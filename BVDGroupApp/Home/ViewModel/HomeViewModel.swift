//
//  HomeViewModel.swift
//  BVDGroupApp
//
//  Created by khushbu on 07/06/24.
//

import Foundation


@MainActor
class HomeViewModel: NSObject, ObservableObject {

    @Published private var errorData: Error?
    
    
    //MARK: Dependencies
    private let client: any LogoutService
    
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

    init(client: any LogoutService = LogOutHTTPService()) {
        self.client = client
        
    }
    
    func logoutUser() async -> (Bool,Error?) {
        if let sitesResponse = await client.logoutServiceRequest(header:authToken!) {
            switch sitesResponse {
            case .success(_):
                UserDefaults.standard.removePersistentDomain(forName: Bundle.main.bundleIdentifier ?? "")
                    return (true,nil)
                case .failure(let error):
                    return(false,error)
            }
        }
        return (false,nil)
    }
    
}


