//
//  SplashView.swift
//  HikingItemTracker
//
//  Created by Brian Anashari on 15/04/26.
//

import SwiftUI

struct SplashView: View {
    @Environment(AppRouter.self) private var router
    @Environment(AppSession.self) private var session

    var body: some View {
        VStack {
            Image("img_splash")
                .resizable()
                .scaledToFit()
            
            Text("Mountrack")
                .font(.title)
                .fontWeight(.bold)
        }
        .task {
            try? await Task.sleep(for: .seconds(2))

            if session.hasCompletedOnboarding {
                router.showTripSetup()
            } else {
                router.showOnboarding()
            }
        }
    }
}

#Preview {
    SplashView()
        .environment(AppRouter())
        .environment(AppSession())
}
