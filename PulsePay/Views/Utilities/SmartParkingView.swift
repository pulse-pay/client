import SwiftUI

struct SmartParkingView: View {

    var body: some View {
        ZStack {

            // 🖤 BACKGROUND
            AppColors.darkBG
                .ignoresSafeArea()

            ScrollView {
                VStack(spacing: 28) {

                    // 🅿️ HEADER
                    VStack(spacing: 10) {
                        Image("Parking_Car")   // 👈 custom asset
                            .resizable()
                            .scaledToFit()
                            .frame(width: 270, height: 270)

                        Text("Smart Parking")
                            .font(.largeTitle.bold())
                            .foregroundColor(AppColors.textOnDark)

                        Text("Pay & manage parking bills seamlessly")
                            .font(.caption)
                            .foregroundColor(AppColors.textMutedOnDark)
                    }
                    .padding(.top, 20)

                    // 🚀 PRIMARY PARKING ACTIONS
                    VStack(spacing: 16) {

                        actionCard(
                            icon: "qrcode.viewfinder",
                            title: "Scan Parking QR",
                            subtitle: "Scan QR at parking entry or exit"
                        )

                        actionCard(
                            icon: "car.fill",
                            title: "Pay Parking Bill",
                            subtitle: "Pay based on parking duration"
                        )

                        actionCard(
                            icon: "clock.arrow.circlepath",
                            title: "Parking History",
                            subtitle: "View past parking payments"
                        )
                    }

                    // 📍 PARKING SERVICES
                    VStack(alignment: .leading, spacing: 14) {

                        Text("Parking Services")
                            .font(.headline)
                            .foregroundColor(AppColors.textOnDark)

                        VStack(spacing: 12) {
                            serviceRow(
                                title: "Nearby Parking Areas",
                                subtitle: "Find available parking spots"
                            )

                            serviceRow(
                                title: "Live Parking Time",
                                subtitle: "Track parked duration in real time"
                            )

                            serviceRow(
                                title: "Parking Rates",
                                subtitle: "Hourly & daily parking charges"
                            )

                            serviceRow(
                                title: "Supported Locations",
                                subtitle: "Malls, offices, stations & more"
                            )
                        }
                        .padding()
                        .background(Color.white.opacity(0.05))
                        .cornerRadius(16)
                    }

                    // 🧾 RECENT PARKING BILLS
                    VStack(alignment: .leading, spacing: 14) {

                        Text("Recent Parking Bills")
                            .font(.headline)
                            .foregroundColor(AppColors.textOnDark)

                        VStack(spacing: 10) {
                            billRow(name: "City Mall Parking", amount: "₹120.00")
                            billRow(name: "Metro Station Parking", amount: "₹60.00")
                            billRow(name: "Office Complex", amount: "₹90.00")
                        }
                        .padding()
                        .background(Color.white.opacity(0.05))
                        .cornerRadius(16)
                    }

                    // ℹ️ INFO / TRUST
                    VStack(alignment: .leading, spacing: 8) {

                        Text("How Smart Parking works")
                            .font(.headline)
                            .foregroundColor(AppColors.textOnDark)

                        Text("""
• Scan QR on entry or exit
• Pay only for parked duration
• Automatic billing with digital receipt
""")
                        .font(.caption)
                        .foregroundColor(AppColors.textMutedOnDark)
                    }
                    .padding()
                    .background(Color.white.opacity(0.05))
                    .cornerRadius(16)

                    Spacer(minLength: 40)
                }
                .padding()
            }
        }
        .navigationTitle("Smart Parking")
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

    private func serviceRow(title: String, subtitle: String) -> some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .foregroundColor(AppColors.textOnDark)

                Text(subtitle)
                    .font(.caption)
                    .foregroundColor(AppColors.textMutedOnDark)
            }
            Spacer()
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

