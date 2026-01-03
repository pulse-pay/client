import SwiftUI

struct EVChargingView: View {

    var body: some View {
        ZStack {

            // 🖤 BACKGROUND
            AppColors.darkBG
                .ignoresSafeArea()

            ScrollView {
                VStack(spacing: 28) {

                    // ⚡ HEADER
                    VStack(spacing: 10) {
                        Image("EV")                 // 👈 EV.png from Assets
                            .resizable()
                            .scaledToFit()
                            .frame(width: 250, height: 250)

                        Text("EV Charging")
                            .font(.largeTitle.bold())
                            .foregroundColor(AppColors.textOnDark)

                        Text("All your EV charging needs in one place")
                            .font(.caption)
                            .foregroundColor(AppColors.textMutedOnDark)
                    }
                    .padding(.top, 20)

                    // 🚀 PRIMARY ACTIONS
                    VStack(spacing: 16) {

                        actionCard(
                            icon: "qrcode.viewfinder",
                            title: "Scan EV QR",
                            subtitle: "Scan QR code at charging station"
                        )

                        actionCard(
                            icon: "doc.text.fill",
                            title: "Pay EV Bill",
                            subtitle: "Enter charging bill details"
                        )

                        actionCard(
                            icon: "clock.arrow.circlepath",
                            title: "EV Bill History",
                            subtitle: "View past EV charging payments"
                        )
                    }

                    // 📍 DISCOVERY & UTILITIES
                    VStack(alignment: .leading, spacing: 14) {

                        Text("Discover EV Services")
                            .font(.headline)
                            .foregroundColor(AppColors.textOnDark)

                        VStack(spacing: 12) {

                            utilityRow(
                                title: "Nearby EV Charging",
                                subtitle: "Find charging stations around you"
                            )

                            utilityRow(
                                title: "Available Chargers",
                                subtitle: "Check charger availability status"
                            )

                            utilityRow(
                                title: "Charging Rates",
                                subtitle: "View per-unit & per-minute rates"
                            )

                            utilityRow(
                                title: "Supported Networks",
                                subtitle: "Tata Power, Ather, ChargeZone & more"
                            )
                        }
                        .padding()
                        .background(Color.white.opacity(0.05))
                        .cornerRadius(16)
                    }

                    // 🧾 RECENT EV BILLS (PREVIEW)
                    VStack(alignment: .leading, spacing: 14) {

                        Text("Recent EV Bills")
                            .font(.headline)
                            .foregroundColor(AppColors.textOnDark)

                        VStack(spacing: 10) {
                            billRow(name: "Tata Power EV", amount: "₹320.00")
                            billRow(name: "Ather Grid", amount: "₹180.50")
                            billRow(name: "ChargeZone", amount: "₹96.20")
                        }
                        .padding()
                        .background(Color.white.opacity(0.05))
                        .cornerRadius(16)
                    }

                    // ℹ️ INFO / TRUST
                    VStack(alignment: .leading, spacing: 8) {

                        Text("How EV charging works")
                            .font(.headline)
                            .foregroundColor(AppColors.textOnDark)

                        Text("""
                            • Discover nearby EV chargers
                            • Scan QR or pay bill manually
                            • Transparent, digital EV billing
                            """)
                        .font(.caption)
                        .foregroundColor(AppColors.textMutedOnDark)
                    }
                    .padding()
                    .background(Color.white.opacity(0.05))
                    .cornerRadius(20)

                    Spacer(minLength: 40)
                }
                .padding()
            }
        }
        .navigationTitle("EV Charging")
        .navigationBarTitleDisplayMode(.inline)
    }

    // MARK: - INLINE STATIC UI COMPONENTS

    private func actionCard(icon: String, title: String, subtitle: String) -> some View {
        HStack(spacing: 14) {

            Image(systemName: icon)
                .font(.system(size: 24))
                .foregroundColor(AppColors.positive)
                .frame(width: 48, height: 48)
                .background(Color.white.opacity(0.08))
                .cornerRadius(14)

            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.headline)
                    .foregroundColor(AppColors.textOnDark)

                Text(subtitle)
                    .font(.caption)
                    .foregroundColor(AppColors.textMutedOnDark)
            }

            Spacer()
        }
        .padding()
        .background(Color.white.opacity(0.06))
        .cornerRadius(18)
    }

    private func utilityRow(title: String, subtitle: String) -> some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .foregroundColor(AppColors.textOnDark)
                Text(subtitle)
                    .font(.caption)
                    .foregroundColor(AppColors.textMutedOnDark)
            }
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundColor(AppColors.textMutedOnDark)
        }
    }

    private func billRow(name: String, amount: String) -> some View {
        HStack {
            Text(name)
                .foregroundColor(AppColors.textOnDark)
            Spacer()
            Text(amount)
                .foregroundColor(AppColors.textOnDark)
        }
    }
}
