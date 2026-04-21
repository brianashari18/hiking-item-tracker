//
//  MountainLibraryViewModel.swift
//  HikingItemTracker
//
//  Created by Brian Anashari on 20/04/26.
//

import Foundation
import Observation

// MARK: - Filter Enum

enum MountainFilter: String, CaseIterable, Identifiable {
    case all       = "Semua"
    case popular   = "Populer"
    case byHeight  = "Ketinggian"
    case byDuration = "Durasi"

    var id: String { rawValue }

    var iconName: String {
        switch self {
        case .all:        return "square.grid.2x2"
        case .popular:    return "star.fill"
        case .byHeight:   return "mountain.2.fill"
        case .byDuration: return "clock.fill"
        }
    }
}

// MARK: - ViewModel

@Observable
final class MountainLibraryViewModel {

    // MARK: - State
    var searchText: String = ""
    var activeFilter: MountainFilter = .all
    var selectedMountain: Mountain? = nil   // trigger detail sheet

    // MARK: - Data
    private let allMountains: [Mountain]

    init(mountains: [Mountain] = Mountain.mocks) {
        self.allMountains = mountains
    }

    // MARK: - Computed

    /// Daftar gunung setelah pencarian + filter + sorting diterapkan
    var filteredMountains: [Mountain] {
        var result = allMountains

        // 1) Filter
        switch activeFilter {
        case .all:
            break
        case .popular:
            result = result.filter { $0.isPopular }
        case .byHeight:
            result = result.sorted { $0.altitude > $1.altitude }
        case .byDuration:
            result = result.sorted { $0.estimatedDurationDays < $1.estimatedDurationDays }
        }

        // 2) Search (nama atau lokasi, case-insensitive)
        if !searchText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            result = result.filter {
                $0.name.localizedCaseInsensitiveContains(searchText)
                || $0.location.localizedCaseInsensitiveContains(searchText)
                || $0.difficulty.localizedCaseInsensitiveContains(searchText)
            }
        }

        return result
    }

    var hasResults: Bool { !filteredMountains.isEmpty }

    // MARK: - Actions

    func selectMountain(_ mountain: Mountain) {
        selectedMountain = mountain
    }

    func clearSelection() {
        selectedMountain = nil
    }
}
