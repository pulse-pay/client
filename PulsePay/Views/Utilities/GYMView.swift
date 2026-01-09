import SwiftUI

struct GYMView: View {

    var body: some View {
        ZStack {

            AppColors.darkBG.ignoresSafeArea()

            ScrollView {
                VStack(spacing: 28) {

                    VStack(spacing: 10) {
                        Image(systemName: "dumbbell.fill")
                            .font(.system(size: 56, weight: .bold))
                            .foregroundColor(AppColors.positive)
                            .frame(width: 64, height: 64)

                        Text("Gym")
                            .font(.largeTitle.bold())
                            .foregroundColor(AppColors.textOnDark)

                        Text("Book & pay for gym sessions")
                            .font(.caption)
                            .foregroundColor(AppColors.textMutedOnDark)
                    }
                    .padding(.top, 20)

                    VStack(spacing: 16) {
                        actionCard("qrcode.viewfinder", "Scan Gym QR", "Scan QR at the gym")
                        actionCard("creditcard.fill", "Pay for Gym Session", "Pay per visit or time used")
                        actionCard("clock.arrow.circlepath", "Usage History", "View past visits")
                    }

                    section("Gym Services") {
                        utilityRow("Nearby Gyms", "Find gyms near you")
                        utilityRow("Available Equipment", "Check machine availability")
                        utilityRow("Membership & Pricing", "Plans and day rates")
                    }

                    infoBox("""
• Access with QR code
• Pay per session or membership
• Track visits and usage
""")

                    Spacer(minLength: 40)
                }
                .padding()
            }
        }
        .navigationTitle("Gym")
        .navigationBarTitleDisplayMode(.inline)
    }

    // Same helpers
    private func actionCard(_ icon: String, _ title: String, _ subtitle: String) -> some View {
        HStack(spacing: 14) {
            Image(systemName: icon)
                .foregroundColor(AppColors.positive)
                .frame(width: 48, height: 48)
                .background(Color.white.opacity(0.08))
                .cornerRadius(14)

            VStack(alignment: .leading, spacing: 4) {
                Text(title).foregroundColor(AppColors.textOnDark)
                Text(subtitle).font(.caption).foregroundColor(AppColors.textMutedOnDark)
            }
            Spacer()
        }
        .padding()
        .background(Color.white.opacity(0.06))
        .cornerRadius(18)
    }

    private func utilityRow(_ title: String, _ subtitle: String) -> some View {
        HStack {
            VStack(alignment: .leading) {
                Text(title).foregroundColor(AppColors.textOnDark)
                Text(subtitle).font(.caption).foregroundColor(AppColors.textMutedOnDark)
            }
            Spacer()
        }
    }

    private func section(_ title: String, @ViewBuilder content: () -> some View) -> some View {
        VStack(alignment: .leading, spacing: 14) {
            Text(title).font(.headline).foregroundColor(AppColors.textOnDark)
            VStack(spacing: 12) { content() }
                .padding()
                .background(Color.white.opacity(0.05))
                .cornerRadius(16)
        }
    }

    private func infoBox(_ text: String) -> some View {
        VStack(alignment: .leading) {
            Text("How the Gym works")
                .font(.headline)
                .foregroundColor(AppColors.textOnDark)
            Text(text)
                .font(.caption)
                .foregroundColor(AppColors.textMutedOnDark)
        }
        .padding()
        .background(Color.white.opacity(0.05))
        .cornerRadius(16)
    }
}
