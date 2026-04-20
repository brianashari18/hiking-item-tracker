//
//  TripSetupViewModel.swift
//  HikingItemTracker
//
//  Created by Brian Anashari on 15/04/26.
//

import Foundation
import Observation

@Observable
final class TripSetupViewModel {
    let mountains: [Mountain]
    
    var selectedMountain: Mountain
    var selectedStartDate: Date = Date()
    var selectedEndDate: Date = Date()
    var fullName: String = ""
    var numberOfPeople: Int = 1

    init(mountains: [Mountain] = Mountain.mocks) {
        self.mountains = mountains
        self.selectedMountain = mountains.first!
    }
    
    var minimumStartDate: Date {
        Calendar.current.startOfDay(for: Date())
    }

    var minimumEndDate: Date {
        max(selectedStartDate, minimumStartDate)
    }

    var isFormValid: Bool {
        !fullName.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
            && selectedEndDate >= selectedStartDate
    }

    func updateStartDate(_ date: Date) {
        selectedStartDate = date

        if selectedEndDate < date {
            selectedEndDate = date
        }
    }
}
