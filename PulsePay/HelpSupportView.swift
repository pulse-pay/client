import SwiftUI

struct HelpSupportView: View {
    var body: some View {
        ZStack {
            AppColors.darkBG.ignoresSafeArea()
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    Text("Find FAQs or contact support.")
                        .foregroundColor(AppColors.textMutedOnDark)

                    VStack(spacing: 12) {
                        faqRow(question: "How do I reset my PIN?")
                        faqRow(question: "Why was my payment declined?")
                        faqRow(question: "How to link a bank account?")
                        Button {
                            // Contact support
                        } label: {
                            HStack {
                                Image(systemName: "envelope.fill")
                                    .foregroundColor(AppColors.accentBlue)
                                Text("Contact Support")
                                    .foregroundColor(AppColors.textOnDark)
                                Spacer()
                            }
                            .padding(.vertical, 10)
                        }
                        .buttonStyle(.plain)
                    }
                    .padding()
                    .background(Color.white.opacity(0.06))
                    .cornerRadius(16)
                }
                .padding()
            }
        }
        .navigationTitle("Help & Support")
        .navigationBarTitleDisplayMode(.inline)
    }

    @ViewBuilder
    private func faqRow(question: String) -> some View {
        HStack {
            Text(question)
                .foregroundColor(AppColors.textOnDark)
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
        }
        .padding(.vertical, 10)
    }
}
