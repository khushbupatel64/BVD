//
//  QRScannerView.swift
//  BVDAPP
//
//  Created by khushbu on 04/06/25.
//

import SwiftUI
import CodeScanner

struct QRScannerView: View {
    @StateObject private var viewModel = ScannerViewModel()

    var body: some View {
        NavigationStack {
            VStack(spacing: 10) {
                if let code = viewModel.scannedCode {
                    Text(code)
                }
                
                Button("Scan Code") {
                    viewModel.isPresentingScanner = true
                }
                
                Text("Scan a QR code to begin")
            }
            .sheet(isPresented: $viewModel.isPresentingScanner) {
                CodeScannerView(codeTypes: [.qr]) { response in
                    viewModel.handleScan(result: response)
                }
            }
        }
    }
}


#Preview {
    QRScannerView()
}
