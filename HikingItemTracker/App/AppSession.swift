//
//  AppSession.swift
//  HikingItemTracker
//
//  Created by Brian Anashari on 15/04/26.
//

import Foundation
import Observation

/// AppSession menyimpan state global yang perlu dibagikan lintas root-view.
/// Khususnya digunakan sebagai data bridge antar layar yang tidak terhubung
/// lewat NavigationStack push (karena app menggunakan switch-based routing).
///
/// Alur data:
/// MountainLibrary → [selectedMountain] → TripSetup → [tripSetupData] → PackingChecklist
@Observable
final class AppSession {
    var hasCompletedOnboarding: Bool = false

    /// Gunung yang dipilih user dari MountainLibrary.
    /// Di-set oleh MountainDetailSheet saat user mengetuk "Pilih Gunung Ini".
    var selectedMountain: Mountain? = nil

    /// Data trip lengkap yang di-submit dari TripSetupForm.
    /// Digunakan untuk men-generate PackingChecklist secara otomatis.
    var tripSetupData: TripSetupData? = nil

    /// Reset data trip (misalnya saat user kembali ke TripIntro)
    func resetTripData() {
        selectedMountain = nil
        tripSetupData = nil
    }

    // MARK: - Preview Factory

    /// Session siap-pakai untuk SwiftUI Previews.
    /// Sudah berisi gunung pilihan dan tripSetupData mock agar layar
    /// downstream (TripSetup, PackingChecklist) bisa dipreview tanpa
    /// menjalankan seluruh alur dari awal.
    static var preview: AppSession {
        let s = AppSession()
        let mountain = Mountain.mocks[18]   // Gunung Semeru — Grade IV
        s.selectedMountain = mountain
        s.tripSetupData = TripSetupData(
            mountain: mountain,
            startDate: Date(),
            endDate: Calendar.current.date(byAdding: .day, value: 3, to: Date()) ?? Date(),
            fullName: "Brian Anashari",
            numberOfPeople: 4
        )
        return s
    }
}
