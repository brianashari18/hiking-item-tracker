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
import DotLottie

// MARK: - Placeholder (used until Lottie is installed)
struct LottieView: View {
    let animationName: String
    var loopMode: String = "loop"

    var body: some View {
            DotLottieAnimation(
                fileName: animationName,
                config: AnimationConfig(autoplay: true, loop: true)
            )
            .view()
        }

}

#Preview {
    LottieView(animationName: "Traveler")
        .frame(width: 300, height: 280)
        .padding()
}
