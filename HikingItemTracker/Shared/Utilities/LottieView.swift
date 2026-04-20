//
//  LottieView.swift
//  HikingItemTracker
//
//  Created by Brian Anashari on 20/04/26.
//
//  SETUP: Add Lottie via Swift Package Manager
//  URL: https://github.com/airbnb/lottie-ios
//  Then place your .json animation file in the Resources folder.
//

import SwiftUI

// MARK: - Lottie Wrapper
// Uncomment the block below after adding the Lottie SPM package:
//
// import Lottie
//
// struct LottieView: UIViewRepresentable {
//     let animationName: String
//     var loopMode: LottieLoopMode = .loop
//
//     func makeUIView(context: Context) -> LottieAnimationView {
//         let view = LottieAnimationView(name: animationName)
//         view.loopMode = loopMode
//         view.contentMode = .scaleAspectFit
//         view.play()
//         return view
//     }
//
//     func updateUIView(_ uiView: LottieAnimationView, context: Context) {}
// }

// MARK: - Placeholder (used until Lottie is installed)
struct LottieView: View {
    let animationName: String
    var loopMode: String = "loop"

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color(.systemGroupedBackground))

            VStack(spacing: 12) {
                Image(systemName: "figure.hiking")
                    .font(.system(size: 64))
                    .foregroundStyle(.green)

                Text("Lottie: \(animationName)")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
        }
    }
}

#Preview {
    LottieView(animationName: "hiking_animation")
        .frame(width: 300, height: 280)
        .padding()
}
