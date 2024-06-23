//
//  SitesRow.swift
//  BVDGroupApp
//
//  Created by khushbu on 07/06/24.
//

import Foundation
import SwiftUI

struct SitesRowView: View {
    
    var site: FuelSite
    
    
    var body: some View {
        HStack {
            details
        }.padding(.vertical)
    }
    
    var details: some View {
        VStack(alignment: .leading, spacing: 5) {
            name
            address
            city
        }
    }
    
    var name: some View {
        Text(site.name!)
            .font(.headline)
            .foregroundColor(.primary)
            .bold()
    }
    
    var address: some View {
        HStack(alignment: .firstTextBaseline) {
            Text(site.terminal_name!)
                .font(.body)
                .foregroundColor(.secondary)
        }
    }
    
    var city: some View {
        Text("\(site.city!)\(site.status!)")
            .font(.body)
            .foregroundColor(.secondary)
            .bold()
    }
    
}

#Preview {
    SitesRowView(site:FuelSite(id: 123, state_id: 2, country_id: 2, number: "3434", name: "BVD Group", group_number: "343", manned: 4, in_yard: 5, status: 6, city: "Toronto", address: "M1S1x3", phone: "43755958498", zip: "M1S1c3", latitude: 34.4545, longitude: 76.3343, latitude_direction: "Up", longitude_direction: "Dwon", hours: "4", deleted: 1, created_at: "2026/12/23", updated_at: "2025/02/23", terminal_name: "test", state: State(id: 1, country_id:1, created_at: "343", updated_at: "223", name: "Toronto", abbreviation:"sdsds")))
}
