//
//  AppRoutes.swift
//  HikingItemTracker
//
//  Created by Brian Anashari on 20/04/26.
//

enum AppRoute: Equatable {
    case splash
    case onboarding
    case tripIntro
    case tripSetup(Mountain? = nil)
    case packingChecklist(mountain: Mountain? = nil, tripDate: String? = nil, duration: Int = 1, numberOfPeople: Int = 1)
    case onHikeDashboard(mountain: Mountain, hikingTrip: HikingTripModel)
    case mountainLibrary
}
