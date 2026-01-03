import SwiftUI

struct UsageSettlementAllView: View {

    let items: [DashboardItem]

    var body: some View {
        ZStack {
            AppColors.darkBG.ignoresSafeArea()

            ScrollView {
                LazyVGrid(
                    columns: Array(repeating: .init(.flexible()), count: 4),
                    spacing: 16
                ) {
                    ForEach(items) { item in
                        NavigationLink {
                            UsageSettlementRouter.destinationView(for: item)
                        } label: {
                            BillIcon(item: item)
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding(.horizontal)
                .padding(.top, 16)
            }
        }
        .navigationTitle("Usage & Settlement")
        .navigationBarTitleDisplayMode(.inline)
    }
}
