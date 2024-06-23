//
//  ProfileDetailViewModel.swift
//  BVDGroupApp
//
//  Created by khushbu on 11/06/24.
//

import Foundation
import Combine
import SwiftUI

class ProfileDetailViewModel: ObservableObject {
    @AppStorage("userDetails") private var userData: Data?
    @Published var userProfile: User?
    @Published var errorMessage: String?

    init() {
        loadUserProfile()
    }

    func loadUserProfile() {
        if let data = userData {
            let decoder = JSONDecoder()
            if let loadedUser = try? decoder.decode(User.self, from: data) {
                userProfile = loadedUser
            } else {
                errorMessage = "Failed to decode user data."
            }
        } else {
            errorMessage = "No data found."
        }
    }
}
