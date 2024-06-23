//
//  ContentView.swift
//  BVDGroupApp
//
//  Created by khushbu on 06/06/24.
//

import SwiftUI

struct ContentView: View {
    @SwiftUI.State private var isAuthenticated: Bool = UserDefaults.standard.bool(forKey: "isAuthenticated")
   
    var body: some View {
        VStack {
            if isAuthenticated {
                AppRootView(showingView: ShowingView(showingView: AppViews.HomeView))
            } else {
                AppRootView(showingView: ShowingView(showingView: AppViews.LoginView))
            }
        }
        .animation(.easeInOut, value: isAuthenticated)
        .transition(.slide)
    }
}

#Preview {
    ContentView()
}


enum AppViews {
    case LoginView
    case HomeView
}


class ShowingView: ObservableObject {
    
    init(showingView: AppViews) {
        self.viewId = showingView
    }
    
    @Published var viewId : AppViews
}


struct AppRootView: View {
    
    @ObservedObject var showingView: ShowingView
    
    var body: some View {
       if showingView.viewId == .LoginView {
            LoginView(showingView:showingView)
        }
        else {
            HomeView(showingView:showingView)
        }

    }
}
