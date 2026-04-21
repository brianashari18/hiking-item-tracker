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

    // MARK: - Fixed (injected from MountainLibrary)
    let selectedMountain: Mountain

    // MARK: - User Input
    var selectedStartDate: Date = Date()
    var selectedEndDate: Date = Date()
    var fullName: String = ""
    var numberOfPeople: Int = 1

    // MARK: - Init

    /// Inisialisasi dengan gunung yang sudah dipilih dari MountainLibrary.
    /// Mountain tidak lagi bisa diubah di layar ini.
    init(selectedMountain: Mountain) {
        self.selectedMountain = selectedMountain
    }

    // MARK: - Date Helpers

    var minimumStartDate: Date {
        Calendar.current.startOfDay(for: Date())
    }

    var minimumEndDate: Date {
        max(selectedStartDate, minimumStartDate)
    }

    func updateStartDate(_ date: Date) {
        selectedStartDate = date
        if selectedEndDate < date {
            selectedEndDate = date
        }
    }

    // MARK: - Validation

    var isFormValid: Bool {
        !fullName.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
            && selectedEndDate >= selectedStartDate
    }

    // MARK: - Data Bridge

    /// Mengemas semua input user bersama mountain yang sudah dipilih
    /// menjadi satu paket TripSetupData untuk diteruskan ke PackingChecklist.
    func buildTripSetupData() -> TripSetupData {
        TripSetupData(
            mountain: selectedMountain,
            startDate: selectedStartDate,
            endDate: selectedEndDate,
            fullName: fullName,
            numberOfPeople: numberOfPeople
        )
    }
}
