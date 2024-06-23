//
//  BVDAPPApp.swift
//  BVDAPP
//
//  Created by khushbu on 04/06/25.
//


import SwiftUI

struct ErrorView: View {
    var errorText: String
    var body: some View {
        VStack {
            Spacer()
            Text("An Error has occured")
                .font(.title)
                .padding(.bottom)
                .foregroundColor(.black)
            Text(errorText)
                .font(.headline)
                .foregroundColor(.gray)
            Spacer()
        }
    }
}

#Preview {
    ErrorView(errorText: "error")
}
