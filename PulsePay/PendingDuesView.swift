//
//  PendingDuesView.swift
//  PulsePay
//
//  Created by Anindya Mukhopadhyay on 01/01/26.
//

import SwiftUI

struct PendingDuesView: View {
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()

            VStack(spacing: 20) {
                Image(systemName: "exclamationmark.circle.fill")
                    .font(.system(size: 64))
                    .foregroundColor(.orange)

                Text("Pending Dues")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)

                Text("Items awaiting payment")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
        .navigationTitle("Pending Dues")
        .navigationBarTitleDisplayMode(.inline)
    }
}
