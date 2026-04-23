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

    func showPackingChecklist(mountainName: String? = nil, tripDate: String? = nil) {
        currentRoute = .packingChecklist(mountainName, tripDate)
    }

    func showOnHikeDashboard() {
        currentRoute = .onHikeDashboard
    }

    func showTripSetupFromFinish() {
        currentRoute = .tripSetup()
    }
    
    func showMountainLibrary() {
        currentRoute = .mountainLibrary
    }
}
