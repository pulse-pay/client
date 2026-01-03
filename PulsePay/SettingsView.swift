import SwiftUI

struct SettingsView: View {
    var body: some View {
        ZStack {
            AppColors.darkBG.ignoresSafeArea()
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    Text("General app preferences.")
                        .foregroundColor(AppColors.textMutedOnDark)

                    VStack(spacing: 12) {
                        pickerRow(title: "Theme", options: ["System", "Light", "Dark"], selection: 0)
                        pickerRow(title: "Language", options: ["English", "Hindi"], selection: 0)
                    }
                    .padding()
                    .background(Color.white.opacity(0.06))
                    .cornerRadius(16)
                }
                .padding()
            }
        }
        .navigationTitle("Settings")
        .navigationBarTitleDisplayMode(.inline)
    }

    @ViewBuilder
    private func pickerRow(title: String, options: [String], selection: Int) -> some View {
        HStack {
            Text(title)
                .foregroundColor(AppColors.textOnDark)
            Spacer()
            Menu(options[selection]) {
                ForEach(options, id: \.self) { opt in
                    Button(opt) {}
                }
            }
            .foregroundColor(AppColors.textOnDark)
        }
        .padding(.vertical, 10)
    }
}
