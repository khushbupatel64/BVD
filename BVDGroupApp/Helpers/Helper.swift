//
//  Helper.swift
//  BVDAPP
//
//  Created by khushbu on 04/06/25.
//

import Foundation

import SwiftUI

extension View{
    func applyBG() -> some View{
        self
            .frame(maxWidth: .infinity,maxHeight: .infinity)
            .ignoresSafeArea()
    }
}

enum Tab: String,CaseIterable   {
    case home = "Map"
    case Profile = "Profile"
    case QRScanner = "QRScanner"
    
}



extension Color {
    static var themeTextField: Color {
        return Color(red: 220.0/255.0, green: 230.0/255.0, blue: 230.0/255.0, opacity: 1.0)
    }
}


extension String{
     func isValidEmail() -> Bool {
         let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
         let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
         return emailPred.evaluate(with: self)
     }
}


 
 private func isPasswordValid(_ password : String) -> Bool{
     let passwordFormat = "^(?=.*[A-Z])(?=.*[a-z])(?=.*?[0-9])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}"
     let passwordTest = NSPredicate(format: "SELF MATCHES %@", passwordFormat)
     return passwordTest.evaluate(with: password)
 }


extension Encodable {
    var convertToDict: Any? {
        let jsonEncoder = JSONEncoder()
        jsonEncoder.outputFormatting = .prettyPrinted
        do {
                let jsonData = try jsonEncoder.encode(self)
                if let dictionary = try JSONSerialization.jsonObject(with: jsonData, options: []) as? [String: Any] {
                    return dictionary
                }
            } catch {
                print("Failed to convert model to dictionary:")
            return nil
        }
        return nil
    }
}


extension UserDefaults {
    func set<T: Codable>(_ object: T, forKey key: String) {
        if let data = try? JSONEncoder().encode(object) {
            self.set(data, forKey: key)
        }
    }

    func object<T: Codable>(forKey key: String, as type: T.Type) -> T? {
        guard let data = self.data(forKey: key) else { return nil }
        return try? JSONDecoder().decode(type, from: data)
    }
}


