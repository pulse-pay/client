import SwiftUI

struct PersonalInformationView: View {
    var body: some View {
        ZStack {
            AppColors.darkBG.ignoresSafeArea()
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    Text("Update your name, email, phone, and address.")
                        .foregroundColor(AppColors.textMutedOnDark)

                    // Placeholder content
                    Group {
                        LabeledContent("Full Name", value: "Anindya Mukhopadhyay")
                        LabeledContent("Email", value: "anindya@pulsepay.app")
                        LabeledContent("Phone", value: "+91 98765 43210")
                        LabeledContent("Address", value: "Add your address")
                    }
                    .foregroundColor(AppColors.textOnDark)
                    .padding()
                    .background(Color.white.opacity(0.06))
                    .cornerRadius(16)
                }
                .padding()
            }
        }
        .navigationTitle("Personal Information")
        .navigationBarTitleDisplayMode(.inline)
    }
}
