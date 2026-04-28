//
//  AppSession.swift
//  HikingItemTracker
//
//  Created by Brian Anashari on 15/04/26.
//

import Foundation
import Observation

@Observable
final class AppSession {
    var hasCompletedOnboarding: Bool = false
    var activeTrip: HikingTripModel? {
        didSet {
            saveTrip()
        }
    }
    
    private let tripKey = "com.muncakin.activeTrip"
    
    init() {
        self.activeTrip = loadTrip()
    }
    
    private func saveTrip() {
        if let trip = activeTrip {
            if let encoded = try? JSONEncoder().encode(trip) {
                UserDefaults.standard.set(encoded, forKey: tripKey)
            }
        } else {
            UserDefaults.standard.removeObject(forKey: tripKey)
        }
    }
    
    private func loadTrip() -> HikingTripModel? {
        if let data = UserDefaults.standard.data(forKey: tripKey) {
            if let decoded = try? JSONDecoder().decode(HikingTripModel.self, from: data) {
                return decoded
            }
        }
        return nil
    }
}
