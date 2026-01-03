//
//  UsageSettlementView.swift
//  PulsePay
//
//  Created by Anindya Mukhopadhyay on 01/01/26.
//

import SwiftUI

struct UsageSettlementView: View {

    let items: [DashboardItem]
    @State private var isExpanded = false

    private var displayedItems: [DashboardItem] {
        isExpanded ? items : Array(items.prefix(4))
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {

            HStack {
                Text("Usage & Settlement")
                    .font(.title3.bold())
                    .foregroundColor(.white)

                Spacer()

                if items.count > 4 {
                    Button {
                        withAnimation(.easeInOut) {
                            isExpanded.toggle()
                        }
                    } label: {
                        HStack(spacing: 4) {
                            Text(isExpanded ? "View Less" : "View All")
                                .foregroundColor(.purple)
                            Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                                .font(.caption)
                                .foregroundColor(.purple)
                        }
                    }
                    .buttonStyle(.plain)
                }
            }

            LazyVGrid(
                columns: Array(repeating: .init(.flexible()), count: 4),
                spacing: 16
            ) {
                ForEach(displayedItems) { item in
                    NavigationLink {
                        UsageSettlementRouter.destinationView(for: item)
                    } label: {
                        BillIcon(item: item)
                    }
                    .buttonStyle(.plain)
                }
            }
            .animation(.easeInOut, value: isExpanded)
        }
    }
}
