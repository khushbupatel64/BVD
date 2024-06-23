//
//  Item.swift
//  BVDGroupApp
//
//  Created by khushbu on 06/06/24.
//

import Foundation
import TabBar


enum TabItem: Int, Tabbable {
    case first = 0
    case second
    case third
    case four
    
    var icon: String {
        switch self {
        case .first:
            return  "house"
        case .second:
            return "qrcode"
        case .third:
            return "fuelpump"
        case .four:
            return "person"
        }
    }
    
    var title: String {
        switch self {
        case .first:
            return "Home"
        case .second:
            return "Scanner"
        case .third:
            return "Sites"
        case .four:
            return "Proifle"
        }
    }
}
