import SwiftUI

struct ScanSuccessOverlay: View {

    @State private var scale: CGFloat = 0.6
    @State private var opacity: Double = 0

    var body: some View {
        ZStack {

            Color.black.opacity(0.6)
                .ignoresSafeArea()

            VStack(spacing: 16) {

                Image(systemName: "checkmark.circle.fill")
                    .font(.system(size: 72))
                    .foregroundColor(.green)
                    .scaleEffect(scale)
                    .opacity(opacity)

                Text("Scan Successful")
                    .font(.headline)
                    .foregroundColor(.white)
                    .opacity(opacity)
            }
            .onAppear {
                withAnimation(
                    .spring(response: 0.45, dampingFraction: 0.65)
                ) {
                    scale = 1.0
                    opacity = 1.0
                }
            }
        }
    }
}
