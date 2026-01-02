import SwiftUI

struct EVChargingView: View {

    var body: some View {
        ZStack {

            // 🖤 BACKGROUND
            AppColors.darkBG
                .ignoresSafeArea()

            ScrollView {
                VStack(spacing: 24) {

                    // ⚡ HEADER
                    VStack(spacing: 10) {
                        Image(systemName: "bolt.car.fill")
                            .font(.system(size: 56))
                            .foregroundColor(AppColors.positive)

                        Text("EV Charging")
                            .font(.largeTitle.bold())
                            .foregroundColor(AppColors.textOnDark)

                        Text("Pay per second · Transparent billing")
                            .font(.caption)
                            .foregroundColor(AppColors.textMutedOnDark)
                    }
                    .padding(.top, 20)

                    // 🔋 CURRENT STATUS (STATIC)
                    VStack(alignment: .leading, spacing: 12) {

                        HStack {
                            Text("Current Status")
                                .font(.headline)
                                .foregroundColor(AppColors.textOnDark)

                            Spacer()

                            Text("INACTIVE")
                                .font(.caption.bold())
                                .foregroundColor(.yellow)
                        }

                        Text("₹ 0.00 / sec")
                            .font(.title2.bold())
                            .foregroundColor(AppColors.textOnDark)

                        Text("Connect to a charger to start billing")
                            .font(.caption)
                            .foregroundColor(AppColors.textMutedOnDark)
                    }
                    .padding()
                    .background(Color.white.opacity(0.06))
                    .cornerRadius(20)

                    // 📍 NEARBY EV STATIONS (STATIC)
                    VStack(alignment: .leading, spacing: 14) {

                        Text("Nearby Charging Stations")
                            .font(.headline)
                            .foregroundColor(AppColors.textOnDark)

                        VStack(spacing: 10) {
                            HStack {
                                Text("Tata Power EV Station")
                                    .foregroundColor(AppColors.textOnDark)
                                Spacer()
                                Text("0.8 km · Available")
                                    .font(.caption)
                                    .foregroundColor(AppColors.positive)
                            }

                            HStack {
                                Text("Ather Grid")
                                    .foregroundColor(AppColors.textOnDark)
                                Spacer()
                                Text("1.5 km · Busy")
                                    .font(.caption)
                                    .foregroundColor(.yellow)
                            }

                            HStack {
                                Text("ChargeZone")
                                    .foregroundColor(AppColors.textOnDark)
                                Spacer()
                                Text("2.1 km · Available")
                                    .font(.caption)
                                    .foregroundColor(AppColors.positive)
                            }
                        }
                        .padding()
                        .background(Color.white.opacity(0.05))
                        .cornerRadius(16)
                    }

                    // 🧾 RECENT EV BILLS (STATIC)
                    VStack(alignment: .leading, spacing: 14) {

                        Text("Recent Charging Sessions")
                            .font(.headline)
                            .foregroundColor(AppColors.textOnDark)

                        VStack(spacing: 10) {
                            HStack {
                                Text("Tata Power EV · 12 mins")
                                    .foregroundColor(AppColors.textOnDark)
                                Spacer()
                                Text("₹36.50")
                                    .foregroundColor(AppColors.textOnDark)
                            }

                            HStack {
                                Text("Ather Grid · 8 mins")
                                    .foregroundColor(AppColors.textOnDark)
                                Spacer()
                                Text("₹22.40")
                                    .foregroundColor(AppColors.textOnDark)
                            }
                        }
                        .padding()
                        .background(Color.white.opacity(0.05))
                        .cornerRadius(16)
                    }

                    // ℹ️ BILLING INFO (STATIC)
                    VStack(alignment: .leading, spacing: 8) {

                        Text("Billing Information")
                            .font(.headline)
                            .foregroundColor(AppColors.textOnDark)

                        Text("""
• Charges are calculated per second
• No hidden or idle fees
• Billing stops automatically on disconnect
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
        .navigationTitle("EV Charging")
        .navigationBarTitleDisplayMode(.inline)
    }
}



//ggewdgigkfwekudhygiyweftyidgiwegftdy
