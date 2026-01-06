import SwiftUI

struct BalanceCard: View {

    @State private var start: CGFloat = 0
    @State private var end: CGFloat = 0.25
    private let isActive = true

    var body: some View {
        VStack(alignment: .leading, spacing: 14) {

            // TITLE + STATUS
            HStack {
                Text("PulsePay Balance")
                    .font(.caption)
                    .foregroundColor(AppColors.textMutedOnDark)

                Spacer()

                HStack(spacing: 6) {
                    Circle()
                        .fill(AppColors.positive)
                        .frame(width: 6, height: 6)

                    Text("ACTIVE")
                        .font(.caption2.bold())
                        .foregroundColor(AppColors.positive)
                }
            }

            // BALANCE
            Text("₹ 152.40")
                .font(.system(size: 36, weight: .bold))
                .foregroundColor(AppColors.textOnDark)

            Text("Streaming payments ready")
                .font(.caption)
                .foregroundColor(AppColors.textMutedOnDark)

            // 🔹 ADD MONEY ACTION
            HStack {

                Button {
                    // 🚀 Add money action (API later)
                } label: {
                    HStack(spacing: 6) {
                        Image(systemName: "plus.circle.fill")
                            .font(.system(size: 12))

                        Text("Add Money")
                            .font(.caption.bold())
                    }
                    .foregroundColor(.black)
                    .padding(.horizontal, 14)
                    .padding(.vertical, 8)
                    .background(AppColors.positive)
                    .cornerRadius(10)
                }

                Spacer()

                Text("UPI • Cards • Wallet")
                    .font(.caption2)
                    .foregroundColor(AppColors.textMutedOnDark)
            }
            .padding(.top, 4)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(
            AppColors.darkBG
                .overlay(Color.white.opacity(0.04))
        )
        .cornerRadius(22)

        // ✅ NEON BORDER
        .overlay(
            RoundedRectangle(cornerRadius: 22)
                .trim(from: start, to: end)
                .stroke(
                    AppColors.positive,
                    style: StrokeStyle(
                        lineWidth: 3,
                        lineCap: .round
                    )
                )
                .shadow(
                    color: AppColors.positive.opacity(0.6),
                    radius: 8
                )
        )

        .onAppear {
            guard isActive else { return }

            let duration: Double = 2.5
            let segment: CGFloat = 0.25

            withAnimation(
                .linear(duration: duration)
                    .repeatForever(autoreverses: false)
            ) {
                start = 1
                end = 1 + segment
            }
        }
    }
}
