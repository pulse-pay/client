import SwiftUI

struct SessionHistoryView: View {

    var body: some View {
        ZStack {

            AppColors.darkBG.ignoresSafeArea()

            ScrollView {
                VStack(spacing: 18) {

                    Text("Session History")
                        .font(.largeTitle.bold())
                        .foregroundColor(AppColors.textOnDark)
                        .padding(.top)

                    historyRow("EV Charging", "12 min", "- ₹36.40")
                    historyRow("Public WiFi", "1.2 GB", "- ₹18.00")
                    historyRow("Parking", "45 min", "- ₹60.00")

                    Spacer()
                }
                .padding()
            }
        }
        .navigationTitle("Session History")
        .navigationBarTitleDisplayMode(.inline)
    }

    private func historyRow(_ service: String, _ usage: String, _ amount: String) -> some View {
        HStack {
            VStack(alignment: .leading) {
                Text(service)
                    .foregroundColor(AppColors.textOnDark)
                Text(usage)
                    .font(.caption)
                    .foregroundColor(AppColors.textMutedOnDark)
            }
            Spacer()
            Text(amount)
                .foregroundColor(.red)
        }
        .padding()
        .background(Color.white.opacity(0.05))
        .cornerRadius(16)
    }
}
