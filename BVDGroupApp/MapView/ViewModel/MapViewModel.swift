//
//  MapViewModel.swift
//  BVDAPP
//
//  Created by khushbu on 05/06/24.
//

import Foundation
import GoogleMaps
import CoreLocation
import SwiftUI

class MapViewModel: NSObject, ObservableObject {
    @Published var arrFuelSites: [FuelSite] = []
    @Published var errorMessage: String?
    @Published var authorisationStatus: CLAuthorizationStatus = .notDetermined
    @Published var location: CLLocation?
    
    //MARK: Dependencies
    private let client: any FuelSiteService
    var locationManager = CLLocationManager()
    
    init(client: FuelSiteService = FuelSiteHTTPService()) {
        self.client = client
        self.locationManager = CLLocationManager()
        self.authorisationStatus = self.locationManager.authorizationStatus
        super.init()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    func requestAuthorisation(always: Bool = false) {
        if always {
            self.locationManager.requestAlwaysAuthorization()
        } else {
            self.locationManager.requestWhenInUseAuthorization()
        }
    }
    
    func startLocationUpdates() {
        locationManager.startUpdatingLocation()
    }
    
    func stopLocationUpdates() {
        locationManager.stopUpdatingLocation()
    }
    
    func fetchSitesData() async -> (Bool,Error?) {
        let sitesResponse = await client.fuelSiteServiveReqest()
        switch sitesResponse {
        case .success(let sites):
            if let sitesData = sites.data?.data {
                self.arrFuelSites = sitesData
                return(true,nil)
            }else{
                return (false,APIError.unknown)
            }
        case .failure(let error):
            return(false,error)
        case .none:
            return (false,APIError.unknown)
        }
    }
    
    func requestLocationPermissions() {
        locationManager.requestWhenInUseAuthorization()
    }
}

extension MapViewModel: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        // Handle authorization status changes
        switch status {
        case .authorizedWhenInUse, .authorizedAlways:
            Task {
                await fetchSitesData()
            }
        case .denied, .restricted:
            errorMessage = "Location access denied. Please enable location services in Settings."
        case .notDetermined:
            self.requestLocationPermissions()
        @unknown default:
            break
        }
        self.authorisationStatus = status
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
           self.location = location
            
        }
    }
}
