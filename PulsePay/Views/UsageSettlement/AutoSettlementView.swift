import SwiftUI

struct AutoSettlementView: View {

    var body: some View {
        ZStack {

            AppColors.darkBG.ignoresSafeArea()

            VStack(spacing: 26) {

                Image(systemName: "arrow.triangle.2.circlepath")
                    .font(.system(size: 52))
                    .foregroundColor(AppColors.positive)

                Text("Auto Settlement")
                    .font(.largeTitle.bold())
                    .foregroundColor(AppColors.textOnDark)

                Text("Automatic payment settlement for services")
                    .font(.caption)
                    .foregroundColor(AppColors.textMutedOnDark)

                settingRow("Auto Debit", "Enabled")
                settingRow("Settlement Cycle", "Daily")
                settingRow("Linked Account", "PulsePay Wallet")

                Spacer()
            }
            .padding()
        }
        .navigationTitle("Auto Settlement")
        .navigationBarTitleDisplayMode(.inline)
    }

    private func settingRow(_ title: String, _ value: String) -> some View {
        HStack {
            Text(title)
                .foregroundColor(AppColors.textOnDark)
            Spacer()
            Text(value)
                .foregroundColor(AppColors.textMutedOnDark)
        }
        .padding()
        .background(Color.white.opacity(0.06))
        .cornerRadius(16)
    }
}
