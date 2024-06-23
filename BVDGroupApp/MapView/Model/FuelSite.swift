//
//  FuelSites.swift
//  BVDGroupApp
//
//  Created by khushbu on 06/06/24.
//

import Foundation

struct FuelSite : Codable,Identifiable {
    let id : Int?
    let state_id : Int?
    let country_id : Int?
    let number : String?
    let name : String?
    let group_number : String?
    let manned : Int?
    let in_yard : Int?
    let status : Int?
    let city : String?
    let address : String?
    let phone : String?
    let zip : String?
    var latitude : Double?
    var longitude : Double?
    let latitude_direction : String?
    let longitude_direction : String?
    let hours : String?
    let deleted : Int?
    let created_at : String?
    let updated_at : String?
    let terminal_name : String?
    let state : State?
    
    
    init(id: Int?, state_id: Int?, country_id: Int?, number: String?, name: String?, group_number: String?, manned: Int?, in_yard: Int?, status: Int?, city: String?, address: String?, phone: String?, zip: String?, latitude: Double? = nil, longitude: Double? = nil, latitude_direction: String?, longitude_direction: String?, hours: String?, deleted: Int?, created_at: String?, updated_at: String?, terminal_name: String?, state: State?) {
        self.id = id
        self.state_id = state_id
        self.country_id = country_id
        self.number = number
        self.name = name
        self.group_number = group_number
        self.manned = manned
        self.in_yard = in_yard
        self.status = status
        self.city = city
        self.address = address
        self.phone = phone
        self.zip = zip
        self.latitude = latitude
        self.longitude = longitude
        self.latitude_direction = latitude_direction
        self.longitude_direction = longitude_direction
        self.hours = hours
        self.deleted = deleted
        self.created_at = created_at
        self.updated_at = updated_at
        self.terminal_name = terminal_name
        self.state = state
    }
}
