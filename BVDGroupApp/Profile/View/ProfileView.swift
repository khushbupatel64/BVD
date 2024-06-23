//
//  ProfileViw.swift
//  BVDAPP
//
//  Created by khushbu on 04/06/25.
//

import SwiftUI
import Combine

struct ProfileDetailView: View {
    @StateObject private var viewModel = ProfileDetailViewModel()

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                if let profile = viewModel.userProfile {
                    Text("Full Name: \(profile.first_name) \(profile.last_name)")
                        .font(.subheadline)
                        .foregroundColor(.black)
                    
                    Text("Email Address: \(profile.email)")
                        .font(.subheadline)
                        .foregroundColor(.black)
                    
                    Text("Phone Number: \(profile.phone)")
                        .font(.subheadline)
                        .foregroundColor(.black)
                    
                    Spacer()
                } else if let error = viewModel.errorMessage {
                    NoItemView(text: error)
                } else {
                    NoItemView(text: "Loading...")
                }
            }
            .padding()
            .onAppear {
                viewModel.loadUserProfile()
            }
        }
    }
}



#Preview {
    ProfileDetailView()
}
