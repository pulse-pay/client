//
//  SpendingLimitsView.swift
//  PulsePay
//
//  Created by Anindya Mukhopadhyay on 01/01/26.
//

import SwiftUI

struct SpendingLimitsView: View {
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()

            VStack(spacing: 20) {
                Image(systemName: "lock.fill")
                    .font(.system(size: 64))
                    .foregroundColor(.purple)

                Text("Spending Limits")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)

                Text("Control usage and spending limits")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
        .navigationTitle("Spending Limits")
        .navigationBarTitleDisplayMode(.inline)
    }
}
