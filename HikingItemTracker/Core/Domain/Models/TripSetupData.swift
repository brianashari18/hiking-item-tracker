//
//  TripSetupData.swift
//  HikingItemTracker
//
//  Created by Brian Anashari on 20/04/26.
//

import Foundation

/// Data bridge yang membawa semua input dari TripSetupForm
/// ke PackingChecklistView. Berfungsi sebagai sumber kebenaran tunggal
/// untuk membangun HikingTripModel dan men-generate checklist.
struct TripSetupData {
    let mountain: Mountain
    let startDate: Date
    let endDate: Date
    let fullName: String
    let numberOfPeople: Int

    // MARK: - Computed

    var tripDateString: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.locale = Locale(identifier: "id_ID")

        if Calendar.current.isDate(startDate, inSameDayAs: endDate) {
            return formatter.string(from: startDate)
        }

        let shortFormatter = DateFormatter()
        shortFormatter.dateFormat = "d MMM"
        shortFormatter.locale = Locale(identifier: "id_ID")

        let longFormatter = DateFormatter()
        longFormatter.dateFormat = "d MMM yyyy"
        longFormatter.locale = Locale(identifier: "id_ID")

        return "\(shortFormatter.string(from: startDate)) – \(longFormatter.string(from: endDate))"
    }
}
