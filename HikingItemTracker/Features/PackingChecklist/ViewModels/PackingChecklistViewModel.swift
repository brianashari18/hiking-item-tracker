//
//  PackingChecklistViewModel.swift
//  HikingItemTracker
//
//  Created by Brian Anashari on 20/04/26.
//

import SwiftUI

enum PackingChecklistGroupingMode: String, CaseIterable, Identifiable {
    case functional = "Fungsional"
    case zone       = "Zona"

    var id: String { rawValue }

    var displayTitle: String {
        switch self {
        case .functional: return "Fungsional (Default)"
        case .zone:       return "Zona"
        }
    }
}

@Observable
final class PackingChecklistViewModel {
    var hikingTrip: HikingTripModel
    var selectedItem: LogisticItem?
    var isAddSheetPresented: Bool = false
    var groupingMode: PackingChecklistGroupingMode = .functional

    // MARK: - Computed Sections

    var displayedSections: [LogisticSectionModel] {
        switch groupingMode {
        case .functional: return rebuildFunctionalSections()
        case .zone:       return rebuildZoneSections()
        }
    }

    var progressPercentage: CGFloat { hikingTrip.progressPercentage }
    var mountainName: String       { hikingTrip.mountainName }
    var tripDate: String           { hikingTrip.tripDate }

    // MARK: - Init (Mock — untuk Preview & backward compat)

    init(hikingTrip: HikingTripModel = .mock) {
        self.hikingTrip = hikingTrip
    }

    // MARK: - Init (Real — dari TripSetupData via AppSession)

    /// Inisialisasi dengan data nyata dari alur Library-first.
    /// ChecklistGenerator.generate() secara otomatis membangun sections
    /// berdasarkan metadata gunung dan input user.
    init(tripSetupData: TripSetupData) {
        let generatedSections = ChecklistGenerator.generate(from: tripSetupData)
        self.hikingTrip = HikingTripModel(
            mountainName: tripSetupData.mountain.name,
            tripDate: tripSetupData.tripDateString,
            sections: generatedSections
        )
    }

    // MARK: - Actions

    func togglePackedState(for item: LogisticItem) {
        var updated = item
        updated.isPacked.toggle()
        updateItem(updated)
    }

    func updateItem(_ updatedItem: LogisticItem) {
        for sectionIndex in hikingTrip.sections.indices {
            if let itemIndex = hikingTrip.sections[sectionIndex].items.firstIndex(where: { $0.id == updatedItem.id }) {
                hikingTrip.sections[sectionIndex].items[itemIndex] = updatedItem
                return
            }
        }
    }

    func addItem(_ newItem: LogisticItem) {
        if let sectionIndex = hikingTrip.sections.firstIndex(where: {
            if case .functional(let cat) = $0.categoryType {
                return cat == newItem.functionalCategory
            }
            return false
        }) {
            hikingTrip.sections[sectionIndex].items.append(newItem)
        } else {
            hikingTrip.sections.append(
                LogisticSectionModel(
                    categoryType: .functional(newItem.functionalCategory),
                    items: [newItem]
                )
            )
        }
    }

    func selectItem(_ item: LogisticItem)  { selectedItem = item }

    func deleteItem(_ item: LogisticItem) {
        for sectionIndex in hikingTrip.sections.indices {
            hikingTrip.sections[sectionIndex].items.removeAll { $0.id == item.id }
        }
        hikingTrip.sections.removeAll { $0.items.isEmpty }
    }

    // MARK: - Private Helpers

    private func allItems() -> [LogisticItem] {
        hikingTrip.sections.flatMap(\.items)
    }

    private func rebuildFunctionalSections() -> [LogisticSectionModel] {
        ItemFunctionalCategory.allCases.compactMap { category in
            let items = allItems().filter { $0.functionalCategory == category }
            guard !items.isEmpty else { return nil }
            return LogisticSectionModel(categoryType: .functional(category), items: items)
        }
    }

    private func rebuildZoneSections() -> [LogisticSectionModel] {
        ItemZoneCategory.allCases.compactMap { zone in
            let items = allItems().filter { $0.zoneCategory == zone }
            guard !items.isEmpty else { return nil }
            return LogisticSectionModel(categoryType: .zone(zone), items: items)
        }
    }
}
