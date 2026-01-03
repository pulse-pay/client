//import SwiftUI
//
//struct UsageSettlementMenuView: View {
//
//    var body: some View {
//        ZStack {
//            AppColors.darkBG.ignoresSafeArea()
//
//            List {
//
//                // MARK: - REAL TIME
//                Section(header: sectionHeader("Real-Time")) {
//
//                    menuRow(
//                        icon: "waveform.path.ecg",
//                        color: .green,
//                        title: "Live Usage",
//                        destination: LiveUsageView()
//                    )
//
//                    menuRow(
//                        icon: "indianrupeesign.circle.fill",
//                        color: AppColors.positive,
//                        title: "Live Balance",
//                        destination: LiveBalanceView()
//                    )
//                }
//
//                // MARK: - HISTORY & BILLS
//                Section(header: sectionHeader("History & Bills")) {
//
//                    menuRow(
//                        icon: "clock.arrow.circlepath",
//                        color: .orange,
//                        title: "Session History",
//                        destination: SessionHistoryView()
//                    )
//
//                    menuRow(
//                        icon: "doc.text.fill",
//                        color: .blue,
//                        title: "Invoices & Receipts",
//                        destination: SessionHistoryView() // static reuse
//                    )
//
//                    menuRow(
//                        icon: "chart.bar.fill",
//                        color: .purple,
//                        title: "Billing Summary",
//                        destination: SessionHistoryView() // static placeholder
//                    )
//                }
//
//                // MARK: - PAYMENTS & CONTROL
//                Section(header: sectionHeader("Payments & Control")) {
//
//                    menuRow(
//                        icon: "arrow.triangle.2.circlepath",
//                        color: .cyan,
//                        title: "Auto Settlement",
//                        destination: AutoSettlementView()
//                    )
//
//                    menuRow(
//                        icon: "creditcard.fill",
//                        color: .pink,
//                        title: "Payment Methods",
//                        destination: AutoSettlementView() // static placeholder
//                    )
//
//                    menuRow(
//                        icon: "exclamationmark.circle.fill",
//                        color: .red,
//                        title: "Pending Dues",
//                        destination: AutoSettlementView() // static placeholder
//                    )
//
//                    menuRow(
//                        icon: "lock.fill",
//                        color: .yellow,
//                        title: "Spending Limits",
//                        destination: AutoSettlementView() // static placeholder
//                    )
//                }
//            }
//            .listStyle(.insetGrouped)
//            .scrollContentBackground(.hidden)
//        }
//        .navigationTitle("Usage & Settlement")
//        .navigationBarTitleDisplayMode(.inline)
//    }
//
//    // MARK: - Components
//
//    private func menuRow<Destination: View>(
//        icon: String,
//        color: Color,
//        title: String,
//        destination: Destination
//    ) -> some View {
//        NavigationLink {
//            destination
//        } label: {
//            HStack(spacing: 14) {
//                Image(systemName: icon)
//                    .foregroundColor(color)
//                    .frame(width: 28)
//
//                Text(title)
//                    .foregroundColor(AppColors.textOnDark)
//            }
//        }
//        .listRowBackground(Color.white.opacity(0.08))
//    }
//
//    private func sectionHeader(_ title: String) -> some View {
//        Text(title)
//            .foregroundColor(AppColors.textMutedOnDark)
//            .font(.caption)
//    }
//}
