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

    func showTripSetup() {
        currentRoute = .tripSetup
    }

    func showPackingChecklist() {
        currentRoute = .packingChecklist
    }

    func showOnHikeDashboard() {
        currentRoute = .onHikeDashboard
    }

    func showTripSetupFromFinish() {
        currentRoute = .tripSetup
    }
}
