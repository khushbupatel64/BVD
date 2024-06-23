//
//  UserAuth.swift
//  BVDGroupApp
//
//  Created by khushbu on 06/06/24.
//

import Foundation
import Combine
import SwiftUI

class UserAuth: ObservableObject {
    @AppStorage("isLoggedIn") var isLoggedIn = false
    @AppStorage("username") var user:Data = Data()
    

    func login(user:User) {
        self.isLoggedIn = true
        guard let userDetailData = try? JSONEncoder().encode(user) else { return }
        self.user = userDetailData
    }
    
    func logut() {
        
    }
}
