import SwiftUI

struct ProfileView: View {

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
                                Circle()
                                    .fill(AppColors.darkBG)

                                Circle()
                                    .fill(Color.white.opacity(0.08))

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

                        // 📋 PROFILE OPTIONS
                        VStack(spacing: 16) {
                            NavigationLink {
                                PersonalInformationView()
                            } label: {
                                ProfileRow(icon: "person.circle", title: "Personal Information")
                                    .contentShape(Rectangle())
                            }

                            NavigationLink {
                                SecurityPrivacyView()
                            } label: {
                                ProfileRow(icon: "lock.circle", title: "Security & Privacy")
                                    .contentShape(Rectangle())
                            }

                            NavigationLink {
                                NotificationsView()
                            } label: {
                                ProfileRow(icon: "bell.circle", title: "Notifications")
                                    .contentShape(Rectangle())
                            }

                            NavigationLink {
                                PaymentMethodsView()
                            } label: {
                                ProfileRow(icon: "creditcard.circle", title: "Payment Methods")
                                    .contentShape(Rectangle())
                            }

                            NavigationLink {
                                SettingsView()
                            } label: {
                                ProfileRow(icon: "gearshape.circle", title: "Settings")
                                    .contentShape(Rectangle())
                            }

                            NavigationLink {
                                HelpSupportView()
                            } label: {
                                ProfileRow(icon: "questionmark.circle", title: "Help & Support")
                                    .contentShape(Rectangle())
                            }
                        }
                        .buttonStyle(.plain)
                        .padding()
                        .background(Color.white.opacity(0.06))
                        .cornerRadius(20)

                        // 🚪 LOGOUT SECTION (NOW CLEAR & VISIBLE)
                        VStack(spacing: 12) {
                            Button {
                                // logout logic later
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

                        // ⬇️ EXTRA SPACE FOR SCROLL FEEL
                        Spacer(minLength: 40)
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 30) // 👈 allows scroll bounce & visibility
                }
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
