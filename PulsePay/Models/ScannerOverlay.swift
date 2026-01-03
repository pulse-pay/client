//import SwiftUI
//
//struct ScannerOverlay: View {
//
//    var body: some View {
//        GeometryReader { geo in
//            Path { path in
//                path.addRect(geo.frame(in: .local))
//
//                let size: CGFloat = 260
//                let origin = CGPoint(
//                    x: (geo.size.width - size) / 2,
//                    y: (geo.size.height - size) / 2
//                )
//
//                path.addRoundedRect(
//                    in: CGRect(origin: origin,
//                               size: CGSize(width: size, height: size)),
//                    cornerSize: CGSize(width: 16, height: 16)
//                )
//            }
//            .fill(Color.black.opacity(0.55),
//                  style: FillStyle(eoFill: true))
//        }
//        .ignoresSafeArea()
//    }
//}
