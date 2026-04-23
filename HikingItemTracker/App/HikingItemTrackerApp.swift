//
//  HikingItemTrackerApp.swift
//  HikingItemTracker
//
//  Created by Brian Anashari on 14/04/26.
//

import SwiftUI

@main
struct HikingItemTrackerApp: App {
    @State private var router = AppRouter()
    @State private var session = AppSession()

    var body: some Scene {
        WindowGroup {
            AppRootView()
                .environment(router)
                .environment(session)
        }
    }
}

private struct AppRootView: View {
    @Environment(AppRouter.self) private var router

    var body: some View {
        switch router.currentRoute {
        case .splash:
            SplashView()
        case .onboarding:
            OnboardingView()
        case .tripIntro:
            TripIntroView()
        case .tripSetup(let selectedMountain):
            TripSetupView(mountain: selectedMountain)
        case .packingChecklist(let mountainName, let tripDate):
            PackingChecklistView(mountainName: mountainName, tripDate: tripDate)
        case .onHikeDashboard:
            OnHikeDashboardView()
        case .mountainLibrary:
            MountainLibraryView()
        }
    }
}
