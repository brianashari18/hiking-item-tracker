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

    init(mountains: [Mountain] = Mountain.mocks, preSelectedMountain: Mountain? = nil) {
        self.mountains = mountains
        
        if let preSelected = preSelectedMountain {
            self.selectedMountain = preSelected
        } else {
            self.selectedMountain = mountains.first!
        }
        
        let minDurationDays = self.selectedMountain.duration
        self.selectedEndDate = Calendar.current.date(byAdding: .day, value: minDurationDays, to: self.selectedStartDate) ?? self.selectedStartDate
    }
    
    var minimumStartDate: Date {
        Calendar.current.startOfDay(for: Date())
    }

    var minimumEndDate: Date {
        let minDurationDays = selectedMountain.duration
        return Calendar.current.date(byAdding: .day, value: minDurationDays, to: selectedStartDate) ?? selectedStartDate
    }

    var isFormValid: Bool {
        let startOfEnd = Calendar.current.startOfDay(for: selectedEndDate)
        let startOfMinEnd = Calendar.current.startOfDay(for: minimumEndDate)
        return startOfEnd >= startOfMinEnd
    }

    func updateStartDate(_ date: Date) {
        selectedStartDate = date

        let minDurationDays = selectedMountain.duration
        let minEndDate = Calendar.current.date(byAdding: .day, value: minDurationDays, to: date) ?? date

        if selectedEndDate < minEndDate {
            selectedEndDate = minEndDate
        }
    }
}
