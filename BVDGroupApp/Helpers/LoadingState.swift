//
//  LoadingState.swift
//  BVDAPP
//
//  Created by khushbu on 04/06/25.
//

import Foundation

import Foundation

enum LoadingState: Equatable {
    case none
    case loading
    case loaded
    case error(Error)

    static func == (lhs: LoadingState, rhs: LoadingState) -> Bool {
        switch (lhs, rhs) {
        case (.loading, .loading):
            return true
        case (.loaded, .loaded):
            return true
        case (.none, .none):
            return true
        case (.error(let error1), .error(let error2)):
            return error1.localizedDescription == error2.localizedDescription
        default:
            return false
        }
    }
}

