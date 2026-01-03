import SwiftUI

struct NotificationsView: View {
    var body: some View {
        ZStack {
            AppColors.darkBG.ignoresSafeArea()
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    Text("Choose which notifications you want to receive.")
                        .foregroundColor(AppColors.textMutedOnDark)

                    VStack(spacing: 12) {
                        toggleRow(title: "Payment Received")
                        toggleRow(title: "Payment Sent")
                        toggleRow(title: "Promotions & Offers")
                        toggleRow(title: "Security Alerts")
                    }
                    .padding()
                    .background(Color.white.opacity(0.06))
                    .cornerRadius(16)
                }
                .padding()
            }
        }
        .navigationTitle("Notifications")
        .navigationBarTitleDisplayMode(.inline)
    }

    @ViewBuilder
    private func toggleRow(title: String) -> some View {
        HStack {
            Text(title)
                .foregroundColor(AppColors.textOnDark)
            Spacer()
            Toggle("", isOn: .constant(true))
                .labelsHidden()
        }
    }
}
