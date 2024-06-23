
//  SitesViewModel.swift
//  BVDAPP
//
//  Created by khushbu on 05/06/24.
//

import Foundation
import GoogleMaps
import CoreLocation
import SwiftUI


class SitesViewModel: NSObject, ObservableObject {
    
    @Published var arrFuelSites: [FuelSite] = []
    @Published  var state = LoadingState.none
    @Published private var errorData: Error?
    
    //MARK: Dependencies
    private let client: any FuelSiteService
    
    init(client: any FuelSiteService = FuelSiteHTTPService()) {
        self.client = client
        
    }
    
    var authToken: String? {
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
    // MARK: FETCH SITE DATA

    func fetchSitesData() async -> (Bool,Error?) {
        state = .loading
        if let sitesResponse = await client.fuelSiteServiveReqest() {
            switch sitesResponse {
            case .success(let sites):
                if let sitesData = sites.data?.data {
                        self.arrFuelSites = sitesData
                        self.state = .loaded
                    
                }
            case .failure(let error):
                state = .error(error)
                return(true,error)
            }
        }
        return (false,nil)
    }
    
}
