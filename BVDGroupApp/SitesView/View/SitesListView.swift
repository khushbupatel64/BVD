//
//  SitesListView.swift
//  BVDGroupApp
//
//  Created by khushbu on 07/06/24.
//

import SwiftUI

struct SitesListView: View {
    
    @ObservedObject var viewModel = SitesViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    List(viewModel.arrFuelSites) { site in
                        NavigationLink(destination:SiteDetailView(fuelSite:site)) {
                            SitesRowView(site: site)
                                .padding(.horizontal)
                        }
                        .listRowSeparator(.visible)
                    }
                    .listStyle(.plain)
                }.onAppear(perform: {
                    Task {
                        await viewModel.fetchSitesData()
                    }
                    
                })
                
            }
        }
    }
}


#Preview {
    SitesListView()
}
