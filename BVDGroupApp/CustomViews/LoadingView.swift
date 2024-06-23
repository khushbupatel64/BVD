//
//  BVDAPPApp.swift
//  BVDAPP
//
//  Created by khushbu on 04/06/25.
//


import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack {
            ProgressView()
                .progressViewStyle(.circular)
        }
    }
}


#Preview {
    LoadingView()
}
