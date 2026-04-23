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
    case packingChecklist(String? = nil, String? = nil)
    case onHikeDashboard
    case mountainLibrary
}
