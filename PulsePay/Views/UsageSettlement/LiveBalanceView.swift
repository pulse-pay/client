import SwiftUI

struct LiveBalanceView: View {

    var body: some View {
        ZStack {

            AppColors.darkBG.ignoresSafeArea()

            VStack(spacing: 26) {

                Image(systemName: "indianrupeesign.circle.fill")
                    .font(.system(size: 56))
                    .foregroundColor(AppColors.positive)

                Text("Live Balance")
                    .font(.largeTitle.bold())
                    .foregroundColor(AppColors.textOnDark)

                Text("Balance updated in real time")
                    .font(.caption)
                    .foregroundColor(AppColors.textMutedOnDark)

                balanceCard("Available Balance", "₹ 1,240.50")
                balanceCard("Reserved Amount", "₹ 120.00")

                Spacer()
            }
            .padding()
        }
        .navigationTitle("Live Balance")
        .navigationBarTitleDisplayMode(.inline)
    }

    private func balanceCard(_ title: String, _ amount: String) -> some View {
        VStack(spacing: 8) {
            Text(title)
                .font(.caption)
                .foregroundColor(AppColors.textMutedOnDark)
            Text(amount)
                .font(.title2.bold())
                .foregroundColor(AppColors.textOnDark)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.white.opacity(0.06))
        .cornerRadius(20)
    }
}
