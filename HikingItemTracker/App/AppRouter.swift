//
//  AppRouter.swift
//  HikingItemTracker
//
//  Created by Brian Anashari on 15/04/26.
//

import Foundation
import Observation

@Observable
final class AppRouter {
    var currentRoute: AppRoute = .splash

    func showOnboarding() {
        currentRoute = .onboarding
    }

    func showTripIntro() {
        currentRoute = .tripIntro
    }

    func showTripSetup(mountain: Mountain? = nil) {
            currentRoute = .tripSetup(mountain)
    }

    func showPackingChecklist(mountain: Mountain? = nil, tripDate: String? = nil) {
        currentRoute = .packingChecklist(mountain: mountain, tripDate: tripDate)
    }

    func showOnHikeDashboard(mountain: Mountain, hikingTrip: HikingTripModel) {
        currentRoute = .onHikeDashboard(mountain: mountain, hikingTrip: hikingTrip)
    }

    func showTripSetupFromFinish() {
        currentRoute = .mountainLibrary
    }
    
    func showMountainLibrary() {
        currentRoute = .mountainLibrary
    }
}
