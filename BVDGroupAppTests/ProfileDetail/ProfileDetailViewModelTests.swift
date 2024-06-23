//
//  ProfileDetailViewModelTests.swift
//  BVDGroupAppTests
//
//  Created by khushbu on 20/06/24.
//

import XCTest
import XCTest
@testable import BVDGroupApp

// Test class for ProfileDetailViewModel
final class ProfileDetailViewModelTests: XCTestCase {
    
    var model: ProfileDetailViewModel!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        UserDefaults.standard.removeObject(forKey: "userDetails")
    }

    override func tearDownWithError() throws {
        model = nil
        UserDefaults.standard.removeObject(forKey: "userDetails")
        try super.tearDownWithError()
    }
    
    func testInitializationWithValidUserData() throws {
        // Arrange
        let user = User(token_type: "Bearer", expires_in:86400, access_token: "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIyIiwianRpIjoiMWNiMTVlYzhkNDJkMjg1Y2E2YTc2YTZlNWVmZjM0YzM5YTJmODlkZGIwNjFlOThlMjRhNjZhZDEyYjhkZWRmODhkOGVmNjVhM2VlMjE3YjIiLCJpYXQiOjE3MTg4OTUyNzkuODI0MDU2LCJuYmYiOjE3MTg4OTUyNzkuODI0MDU4LCJleHAiOjE3MTg5ODE2NzkuODIwMzEsInN1YiI6IjEwODI1Iiwic2NvcGVzIjpbXX0.mUurs3GjfWURWOyOo5z4iri3QVT2Q6riIGfjC2o8R4_yholSWBD7uvpc-ejVN-VQOuiVBJVw7LrDLn9sr5jpkA", refresh_token: "def502000183a746e38780122416cc1cdaffffedf88076da9a8b33db4bf8da4976085be63e9059a52a11ae14129d5ccf95764ce8e87dee6922b263445d9d517bae39549e0e34355a1c6c509c9f653009f45338841d412abb9cc6029274dd80cafaac7f5f1581fd9817e663a2cbbc82c1d0a9ee5d11aefa132e4722f864bce6fcf00531a3a806afc0632d5e16c926c41f4954de1f040e7cb0f2ff24e5384760bebecf584e7160489dfe4275bd85c0ed94945bfd6a36b30bfa8d1172af3d76a8f58f55a7b4580acdd7622f49a9b0c6dac3e1733dab6660bebcfb48030ccb810b6f7694fe5235e1980c2079b3cb858074737bb7b764256d979d2bbb759e6d1cd4f6a4e856a71f0f384536de147f410fe49444dbf02da26465f4fa34596cef0a9de09e7a006e21ae371f5f07c3b2a2880eb42f69eb70fb666abf956f9f34e443e87e4e14d7e566b2f3aa196cae852d64a26be133430e244051035f766bac45b8add74e4c8578f2", user_id: 10825, first_name: "Test New", last_name: "app", email: "testapp1@gmail.com", phone: "+11111111111", term_accepted: 0, twofactor_accepted: 0)
        let encoder = JSONEncoder()
        let encodedData = try encoder.encode(user)
        UserDefaults.standard.setValue(encodedData, forKey: "userDetails")
        model = ProfileDetailViewModel()
        
        // Assert
        XCTAssertEqual(model.userProfile, user)
        XCTAssertNil(model.errorMessage)
    }
    
    func testInitializationWithInvalidUserData() throws {
        // Arrange
        let invalidData = Data([0x00, 0x01, 0x02])
        UserDefaults.standard.set(invalidData, forKey: "userDetails")
        
        // Act
        model = ProfileDetailViewModel()
        
        // Assert
        XCTAssertNil(model.userProfile)
        XCTAssertEqual(model.errorMessage, "Failed to decode user data.")
    }
    
    func testInitializationWithNoUserData() throws {
        // Act
        model = ProfileDetailViewModel()
        
        // Assert
        XCTAssertNil(model.userProfile)
        XCTAssertEqual(model.errorMessage, "No data found.")
    }
}
