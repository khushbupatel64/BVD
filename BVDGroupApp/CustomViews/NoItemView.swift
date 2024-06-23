//
//  BVDAPPApp.swift
//  BVDAPP
//
//  Created by khushbu on 04/06/25.
//


import SwiftUI

struct NoItemView: View {
    var text: String
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20,
                             style: .continuous )
            .fill(Color(.lightGray).opacity(0.2))
            Text(text)
                .foregroundColor(.white)
                .font(.title2)
        }
        .frame(height: 300)
    }
}

#Preview {
    NoItemView(text: "No data")
}
