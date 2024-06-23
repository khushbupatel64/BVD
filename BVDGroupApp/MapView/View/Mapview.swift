//
//  Mapview.swift
//  BVDAPP
//
//  Created by khushbu on 05/06/24.
//

import SwiftUI

struct Mapview: View {
    
    @ObservedObject var viewModel = MapViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                GoogleMapView(viewModel: viewModel)
                
            }.edgesIgnoringSafeArea(.all)
            .onAppear {
                viewModel.requestLocationPermissions()
            }
        }
    }
}

#Preview {
    Mapview()
}
