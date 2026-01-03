import SwiftUI

struct PaymentMethodsView: View {
    var body: some View {
        ZStack {
            AppColors.darkBG.ignoresSafeArea()
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    Text("Manage your linked bank accounts and cards.")
                        .foregroundColor(AppColors.textMutedOnDark)

                    VStack(spacing: 12) {
                        methodRow(icon: "banknote", title: "Bank Account", subtitle: "HDFC •••• 1234")
                        methodRow(icon: "creditcard", title: "Visa Card", subtitle: "•••• 5678")
                        Button {
                            // Add method
                        } label: {
                            HStack {
                                Image(systemName: "plus.circle.fill")
                                    .foregroundColor(AppColors.accentBlue)
                                Text("Add Payment Method")
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
        .navigationTitle("Payment Methods")
        .navigationBarTitleDisplayMode(.inline)
    }

    @ViewBuilder
    private func methodRow(icon: String, title: String, subtitle: String) -> some View {
        HStack(spacing: 12) {
            Image(systemName: icon)
                .foregroundColor(AppColors.accentBlue)
            VStack(alignment: .leading) {
                Text(title).foregroundColor(AppColors.textOnDark)
                Text(subtitle).font(.caption).foregroundColor(AppColors.textMutedOnDark)
            }
            Spacer()
            Image(systemName: "chevron.right").foregroundColor(.gray)
        }
        .padding(.vertical, 10)
    }
}
