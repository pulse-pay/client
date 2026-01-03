import SwiftUI

struct PublicWiFiView: View {

    var body: some View {
        ZStack {

            AppColors.darkBG
                .ignoresSafeArea()

            ScrollView {
                VStack(spacing: 26) {

                    // 📶 HEADER
                    VStack(spacing: 8) {
                        Image("WiFi")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 60, height: 60)

                        Text("Public WiFi")
                            .font(.largeTitle.bold())
                            .foregroundColor(AppColors.textOnDark)

                        Text("Fast, secure & pay-as-you-use WiFi")
                            .font(.caption)
                            .foregroundColor(AppColors.textMutedOnDark)
                    }
                    .padding(.top, 20)

                    // 📊 CURRENT USAGE SNAPSHOT (STATIC)
                    VStack(alignment: .leading, spacing: 10) {

                        Text("Current Session")
                            .font(.headline)
                            .foregroundColor(AppColors.textOnDark)

                        HStack {
                            VStack(alignment: .leading, spacing: 4) {
                                Text("Not Connected")
                                    .foregroundColor(.yellow)
                                    .font(.headline)

                                Text("No active WiFi session")
                                    .font(.caption)
                                    .foregroundColor(AppColors.textMutedOnDark)
                            }

                            Spacer()

                            VStack(alignment: .trailing, spacing: 4) {
                                Text("₹ 0.00")
                                    .font(.title3.bold())
                                    .foregroundColor(AppColors.textOnDark)

                                Text("Spent today")
                                    .font(.caption)
                                    .foregroundColor(AppColors.textMutedOnDark)
                            }
                        }
                    }
                    .padding()
                    .background(Color.white.opacity(0.06))
                    .cornerRadius(20)

                    // 🚀 PRIMARY ACTIONS (GRID)
                    VStack(alignment: .leading, spacing: 14) {

                        Text("Actions")
                            .font(.headline)
                            .foregroundColor(AppColors.textOnDark)

                        LazyVGrid(
                            columns: [
                                GridItem(.flexible()),
                                GridItem(.flexible())
                            ],
                            spacing: 16
                        ) {
                            actionTile("qrcode.viewfinder", "Scan QR")
                            actionTile("wifi", "Buy Data")
                            actionTile("clock.arrow.circlepath", "Usage History")
                            actionTile("antenna.radiowaves.left.and.right", "Nearby WiFi")
                        }
                    }

                    // 📍 DISCOVERY / SERVICES
                    VStack(alignment: .leading, spacing: 14) {

                        Text("WiFi Services")
                            .font(.headline)
                            .foregroundColor(AppColors.textOnDark)

                        VStack(spacing: 12) {
                            serviceRow("Active Sessions", "View ongoing connections")
                            serviceRow("Data Plans", "Hourly & daily packs")
                            serviceRow("Supported Providers", "RailTel, Airtel, Jio")
                        }
                        .padding()
                        .background(Color.white.opacity(0.05))
                        .cornerRadius(16)
                    }

                    // ℹ️ INFO
                    VStack(alignment: .leading, spacing: 8) {

                        Text("How Public WiFi works")
                            .font(.headline)
                            .foregroundColor(AppColors.textOnDark)

                        Text("""
• Scan QR or connect to hotspot
• Pay only for time or data used
• Secure auto-disconnect on expiry
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
        .navigationTitle("Public WiFi")
        .navigationBarTitleDisplayMode(.inline)
    }

    // MARK: - UI ELEMENTS

    private func actionTile(_ icon: String, _ title: String) -> some View {
        VStack(spacing: 10) {
            Image(systemName: icon)
                .font(.system(size: 22))
                .foregroundColor(AppColors.positive)

            Text(title)
                .font(.caption)
                .foregroundColor(AppColors.textOnDark)
        }
        .frame(maxWidth: .infinity, minHeight: 90)
        .background(Color.white.opacity(0.06))
        .cornerRadius(18)
    }

    private func serviceRow(_ title: String, _ subtitle: String) -> some View {
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
}
