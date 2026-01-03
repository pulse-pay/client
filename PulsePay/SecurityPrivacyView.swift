import SwiftUI

struct SecurityPrivacyView: View {
    var body: some View {
        ZStack {
            AppColors.darkBG.ignoresSafeArea()
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    Text("Manage your password, biometrics, and privacy settings.")
                        .foregroundColor(AppColors.textMutedOnDark)

                    VStack(spacing: 12) {
                        toggleRow(title: "Face/Touch ID")
                        toggleRow(title: "Two-Factor Authentication")
                        toggleRow(title: "Hide Sensitive Info")
                    }
                    .padding()
                    .background(Color.white.opacity(0.06))
                    .cornerRadius(16)
                }
                .padding()
            }
        }
        .navigationTitle("Security & Privacy")
        .navigationBarTitleDisplayMode(.inline)
    }

    @ViewBuilder
    private func toggleRow(title: String) -> some View {
        HStack {
            Text(title)
                .foregroundColor(AppColors.textOnDark)
            Spacer()
            Toggle("", isOn: .constant(true))
                .labelsHidden()
        }
    }
}
