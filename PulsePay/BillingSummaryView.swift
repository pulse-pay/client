//
//  BillingSummaryView.swift
//  PulsePay
//
//  Created by Anindya Mukhopadhyay on 01/01/26.
//

import SwiftUI

struct BillingSummaryView: View {
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()

            VStack(spacing: 20) {
                Image(systemName: "chart.bar.fill")
                    .font(.system(size: 64))
                    .foregroundColor(.blue)

                Text("Billing Summary")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)

                Text("Overview of your billing activity")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
        .navigationTitle("Billing Summary")
        .navigationBarTitleDisplayMode(.inline)
    }
}
