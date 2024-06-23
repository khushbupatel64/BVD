//
//  FuelSitesRequest.swift
//  BVDGroupApp
//
//  Created by khushbu on 06/06/24.
//

import Foundation

protocol FuelSiteService {
    func fuelSiteServiveReqest() async -> Result<SiteBaseModel, Error>?
}
