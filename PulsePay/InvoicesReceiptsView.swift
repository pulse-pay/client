//
//  InvoicesReceiptsView.swift
//  PulsePay
//
//  Created by Anindya Mukhopadhyay on 01/01/26.
//

import SwiftUI

struct InvoicesReceiptsView: View {
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()

            VStack(spacing: 20) {
                Image(systemName: "doc.text.fill")
                    .font(.system(size: 64))
                    .foregroundColor(.teal)

                Text("Invoices & Receipts")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)

                Text("Access all invoices and receipts")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
        .navigationTitle("Invoices & Receipts")
        .navigationBarTitleDisplayMode(.inline)
    }
}
