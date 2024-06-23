//
//  SiteDetail.swift
//  BVDAPP
//
//  Created by khushbu on 04/06/25.
//

import SwiftUI

struct SiteDetailView: View {
    let fuelSite: FuelSite
    
    var body: some View {
        VStack {
            List {
                Text("Name:\(fuelSite.name ?? "")")
                    .foregroundColor(.black)
                    .padding(.bottom)
                Text("Address:\(fuelSite.address ?? "")")
                    .foregroundColor(.black)
                    .padding(.bottom)
                Text("City:\(fuelSite.city ?? "")")
                    .foregroundColor(.black)
                    .padding(.bottom)
                Text("Group Number:\(fuelSite.group_number ?? "")")
                    .foregroundColor(.black)
                    .padding(.bottom)
                Text("Hours:\(fuelSite.hours ?? "")")
                    .foregroundColor(.black)
                    .padding(.bottom)
                Text("yard:\(fuelSite.in_yard ?? 0)")
                    .foregroundColor(.black)
                    .padding(.bottom)
                Text("Latitude:\(fuelSite.latitude ?? 0.0)")
                    .foregroundColor(.black)
                    .padding(.bottom)
                Text("Longitude:\(fuelSite.longitude ?? 0.0)")
                    .foregroundColor(.black)
                    .padding(.bottom)
                
            }
            
        }
        .padding()
        .navigationBarTitle(fuelSite.name!)
    }
}
#Preview {
    SiteDetailView(fuelSite:FuelSite(id: 123, state_id: 2, country_id: 2, number: "3434", name: "BVD Group", group_number: "343", manned: 4, in_yard: 5, status: 6, city: "Toronto", address: "M1S1x3", phone: "43755958498", zip: "M1S1c3", latitude: 34.4545, longitude: 76.3343, latitude_direction: "Up", longitude_direction: "Dwon", hours: "4", deleted: 1, created_at: "2026/12/23", updated_at: "2025/02/23", terminal_name: "test", state: State(id: 1, country_id:1, created_at: "343", updated_at: "223", name: "Toronto", abbreviation:"sdsds")))
}
