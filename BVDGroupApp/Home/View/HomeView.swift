//
//  HomeView.swift
//  BVDAPP
//
//  Created by khushbu on 04/06/25.
//

import SwiftUI
import TabBar

@MainActor
struct HomeView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject var showingView: ShowingView
    @ObservedObject var viewModel: HomeViewModel = HomeViewModel()
    
    @SwiftUI.State private var selection: TabItem = .first
    @SwiftUI.State private var visibility: TabBarVisibility = .visible
    
    var body: some View {
        NavigationStack {
            TabBar(selection: $selection, visibility: $visibility) {
                Mapview()
                    .tabItem(for: TabItem.first)
                QRScannerView()
                    .tabItem(for: TabItem.second)
                SitesListView()
                    .tabItem(for: TabItem.third)
                ProfileDetailView()
                    .tabItem(for: TabItem.four)
                
            } .navigationTitle("Home")
                .navigationBarTitleDisplayMode(.inline)
                .toolbarBackground(
                    Color.white,
                    for: .navigationBar)
                .toolbarBackground(.visible, for: .navigationBar)
                .toolbar {
                    ToolbarItem(placement:.navigationBarTrailing) {
                        Button("Logout") {
                            Task {
                                // LOG OUT USER 
                                let logoutResponse =  await viewModel.logoutUser()
                                if logoutResponse.0 == true {
                                    self.presentationMode.wrappedValue.dismiss()
                                    self.showingView.viewId = AppViews.LoginView
                                }else{
                                    self.showingView.viewId = AppViews.HomeView
                                }
                                
                            }
                        }
                    }
                }
        }
    }
}

#Preview {
    //HomeView(isAuthenticated: .constant(true))
    HomeView( showingView: ShowingView(showingView: AppViews.HomeView))
}
