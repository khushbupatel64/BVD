//
//  QRScannerViewModel.swift
//  BVDGroupApp
//
//  Created by khushbu on 11/06/24.
//

import SwiftUI
import Combine
import CodeScanner

class ScannerViewModel: ObservableObject {
    @Published var scannedCode: String?
    @Published var isPresentingScanner: Bool = false

    func handleScan(result: Result<ScanResult, ScanError>) {
        if case let .success(scanResult) = result {
            scannedCode = scanResult.string
            isPresentingScanner = false
        }
    }
}
