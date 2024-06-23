//
//  MockCLLocationManager.swift
//  BVDGroupAppTests
//
//  Created by khushbu on 17/06/24.
//

import XCTest
import CoreLocation

class MockCLLocationManager: CLLocationManager {
    var mockAuthorizationStatus: CLAuthorizationStatus = .notDetermined
    override var authorizationStatus: CLAuthorizationStatus {
        return mockAuthorizationStatus
    }
}
