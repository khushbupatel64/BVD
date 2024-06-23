//
//  FuelSitesHttpService.swift
//  BVDGroupApp
//
//  Created by khushbu on 06/06/24.
//
import Foundation


class FuelSiteHTTPService : FuelSiteService {
   func fuelSiteServiveReqest() async -> Result<SiteBaseModel, any Error>? {
        var result: Result<SiteBaseModel, Error>?
        if let url = AppEndPoint.getSites(page_length:"10", page: "1", keyword: "", sorting_field: "id", sorting_direction:"ASC").url() {
            result = await NetworkClient.shared.fetchHttpData(from: url, method: "GET", body: nil, responseType:SiteBaseModel.self)
        }
        return result
    }
}
