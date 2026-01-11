import SwiftUI

struct ProfileView: View {

    @AppStorage("isLoggedIn") private var isLoggedIn = false

    var body: some View {
        NavigationStack {
            ZStack {

                // 🖤 DARK BACKGROUND
                AppColors.darkBG
                    .ignoresSafeArea()

                ScrollView(showsIndicators: true) {
                    VStack(spacing: 28) {

                        // 👤 PROFILE HEADER
                        VStack(spacing: 12) {
                            ZStack {
                                Circle().fill(AppColors.darkBG)
                                Circle().fill(Color.white.opacity(0.08))

                                Image(systemName: "person.fill")
                                    .font(.system(size: 42))
                                    .foregroundColor(AppColors.textOnDark)
                            }
                            .frame(width: 90, height: 90)

                            Text("Anindya")
                                .font(.title2.bold())
                                .foregroundColor(AppColors.textOnDark)

                            Text("anindya@pulsepay.app")
                                .font(.caption)
                                .foregroundColor(AppColors.textMutedOnDark)
                        }
                        .padding(.top, 20)

                        // 📋 OPTIONS
                        VStack(spacing: 16) {
                            NavigationLink { PersonalInformationView() } label: {
                                ProfileRow(icon: "person.circle", title: "Personal Information")
                            }

                            NavigationLink { SecurityPrivacyView() } label: {
                                ProfileRow(icon: "lock.circle", title: "Security & Privacy")
                            }

                            NavigationLink { NotificationsView() } label: {
                                ProfileRow(icon: "bell.circle", title: "Notifications")
                            }

                            NavigationLink { PaymentMethodsView() } label: {
                                ProfileRow(icon: "creditcard.circle", title: "Payment Methods")
                            }

                            NavigationLink { SettingsView() } label: {
                                ProfileRow(icon: "gearshape.circle", title: "Settings")
                            }

                            NavigationLink { HelpSupportView() } label: {
                                ProfileRow(icon: "questionmark.circle", title: "Help & Support")
                            }
                        }
                        .buttonStyle(.plain)
                        .padding()
                        .background(Color.white.opacity(0.06))
                        .cornerRadius(20)

                        // 🚪 LOGOUT
                        VStack(spacing: 12) {
                            Button {
                                logout()
                            } label: {
                                Text("Log Out")
                                    .font(.headline)
                                    .foregroundColor(AppColors.negative)
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(Color.white.opacity(0.08))
                                    .cornerRadius(16)
                            }

                            Text("You will need to log in again to access PulsePay.")
                                .font(.caption)
                                .foregroundColor(AppColors.textMutedOnDark)
                        }
                        .padding(.top, 8)

                        Spacer(minLength: 40)
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 30)
                }
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
        }
    }

    // MARK: - LOGOUT
    private func logout() {
        isLoggedIn = false   // ✅ Instantly returns to Splash → Login
    }
}
