//
//  MockFuelSiteService.swift
//  BVDGroupAppTests
//
//  Created by khushbu on 17/06/24.
//

import Foundation
import XCTest
@testable import BVDGroupApp

class MockFuelSiteService: FuelSiteService {
    var fuelSiteResponse: Result<SiteBaseModel, Error>?
    
    enum MockType {
        case failure
        case success
    }
    
    let mockType: MockType
    
    init(mockType: MockType) {
        self.mockType = mockType
    }
    
    
    func fuelSiteServiveReqest() async -> Result<SiteBaseModel, Error>? {
        switch  mockType {
        case .failure:
            return .failure(APIError.unknown)
        case .success:
            return .success(SiteBaseModel.MockResponse)
        }
       
    }
}


extension SiteBaseModel {
    static var MockResponse :SiteBaseModel  {
        return SiteBaseModel(code: 200, message: "Successfully pulled the records.", error: false, data: PageData(current_page: 1, data: [FuelSite(id: 1, state_id: 57, country_id: 2, number: "54197", name: "SURRY", group_number: "98009", manned: 0, in_yard: 0, status: 0, city: "SURRY", address: "0", phone: "0", zip: "0", latitude_direction: "N", longitude_direction: "W", hours:"0", deleted: 0, created_at: "2013-04-13T00:20:55.000000Z", updated_at: "2022-10-01T02:35:40.000000Z", terminal_name: "Vancouver, BC", state: State(id: 57, country_id: 2, created_at: "2013-03-20T23:48:59.000000Z", updated_at: "2013-03-20T23:48:59.000000Z", name: "British Columbia", abbreviation: "BC"))], first_page_url: "https://portal.bvdpetroleum.com:82/api/allFuelSites?page=1", from: 1, last_page: 210, last_page_url: "https://portal.bvdpetroleum.com:82/api/allFuelSites?page=210", links: [Links(url: "", label: "&laquo; Previous", active: false)], next_page_url: "https://portal.bvdpetroleum.com:82/api/allFuelSites?page=2", path: "https://portal.bvdpetroleum.com:82/api/allFuelSites", per_page: "10", prev_page_url: "", to: 10, total: 2093))
    }
}
