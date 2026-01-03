import SwiftUI

struct LiveUsageView: View {

    var body: some View {
        ZStack {

            AppColors.darkBG.ignoresSafeArea()

            VStack(spacing: 24) {

                Image(systemName: "waveform.path.ecg")
                    .font(.system(size: 52))
                    .foregroundColor(AppColors.positive)

                Text("Live Usage")
                    .font(.largeTitle.bold())
                    .foregroundColor(AppColors.textOnDark)

                Text("Track real-time service consumption")
                    .font(.caption)
                    .foregroundColor(AppColors.textMutedOnDark)

                usageCard("EV Charging", "12 min", "₹ 36.40")
                usageCard("Public WiFi", "1.2 GB", "₹ 18.00")

                Spacer()
            }
            .padding()
        }
        .navigationTitle("Live Usage")
        .navigationBarTitleDisplayMode(.inline)
    }

    private func usageCard(_ service: String, _ usage: String, _ cost: String) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(service)
                .foregroundColor(AppColors.textOnDark)
            Text("Usage: \(usage)")
                .font(.caption)
                .foregroundColor(AppColors.textMutedOnDark)
            Text(cost)
                .font(.headline)
                .foregroundColor(AppColors.textOnDark)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.white.opacity(0.06))
        .cornerRadius(18)
    }
}
