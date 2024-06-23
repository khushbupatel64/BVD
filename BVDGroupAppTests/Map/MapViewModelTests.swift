//
//  MapViewModelTests.swift
//  BVDGroupAppTests
//
//  Created by khushbu on 17/06/24.
//

import XCTest
import CoreLocation
@testable import BVDGroupApp

final class MapViewModelTests: XCTestCase {
    
    var viewModel: MapViewModel!
    var mockFuelSiteService: MockFuelSiteService!
    var mockLocationManager: MockCLLocationManager!
    
    override func setUp() {
        super.setUp()
        mockLocationManager = MockCLLocationManager()
        viewModel = MapViewModel()
        viewModel.locationManager = mockLocationManager
        mockLocationManager.delegate = viewModel
    }
    
    override func tearDown() {
        super.tearDown()
        viewModel = nil
        mockLocationManager = nil
        mockFuelSiteService = nil
    }
    
    func testFetchSitesDataSuccess() async {
        let viewModel = MapViewModel(client: MockFuelSiteService(mockType: .success))
        _ = await viewModel.fetchSitesData()
        XCTAssert(viewModel.arrFuelSites.count > 0)
        
    }
    
    func testFetchSitesDataFailure() async {
        let viewModel = MapViewModel(client: MockFuelSiteService(mockType: .failure))
        _ = await viewModel.fetchSitesData()
        XCTAssert(viewModel.arrFuelSites.count <= 0)
    }
    
    func testRequestAuthorisation_WhenInUse() throws {
        viewModel.requestAuthorisation(always: false)
    }
    
    func testRequestAuthorisation_Always() throws {
        viewModel.requestAuthorisation(always: true)
    }
    
    func testStartLocationUpdates() throws {
        viewModel.startLocationUpdates()
    }
    
    func testStopLocationUpdates() throws {
        viewModel.stopLocationUpdates()
    }
    
    func testDidChangeAuthorization_AuthorizedWhenInUse() {
        mockLocationManager.mockAuthorizationStatus = .authorizedWhenInUse
        viewModel.locationManager(mockLocationManager, didChangeAuthorization: .authorizedWhenInUse)
        
        XCTAssertEqual(viewModel.authorisationStatus, .authorizedWhenInUse)
    }
    
    func testDidChangeAuthorization_Denied() {
        mockLocationManager.mockAuthorizationStatus = .denied
        viewModel.locationManager(mockLocationManager, didChangeAuthorization: .denied)
        
        XCTAssertEqual(viewModel.authorisationStatus, .denied)
        XCTAssertEqual(viewModel.errorMessage, "Location access denied. Please enable location services in Settings.")
    }
    
    func testDidUpdateLocations() {
        let location = CLLocation(latitude: 37.7749, longitude: -122.4194)
        viewModel.locationManager(mockLocationManager, didUpdateLocations: [location])
        
        XCTAssertEqual(viewModel.location?.coordinate.latitude, 37.7749)
        XCTAssertEqual(viewModel.location?.coordinate.longitude, -122.4194)
    }
}
