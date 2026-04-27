//
//  AddEditItemViewModel.swift
//  HikingItemTracker
//
//  Created by Brian Anashari on 19/04/26.
//

import SwiftUI

@Observable
final class AddEditItemViewModel {
    private let itemID: UUID?
    var name: String = ""
    var quantity: String = ""
    var selectedUnit: ItemUnit = .pcs
    var selectedOwnership: ItemOwnership = .pribadi
    var selectedFunctionalCategory: ItemFunctionalCategory = .personalItem
    var isEssential: Bool = false
    var isPacked: Bool = false

    let isEditMode: Bool

    // MARK: - Computed

    var navigationTitle: String {
        isEditMode ? "Edit Barang" : "Tambah Barang"
    }

    var isSaveEnabled: Bool {
        !name.trimmingCharacters(in: .whitespaces).isEmpty &&
        !quantity.trimmingCharacters(in: .whitespaces).isEmpty
    }

    // MARK: - Init

    init() {
        self.itemID = nil
        self.isEditMode = false
    }

    init(item: GearItem) {
        self.itemID = item.id
        self.isEditMode = true
        self.name = item.name
        self.quantity = "\(item.quantity)"
        self.selectedUnit = item.unit
        self.selectedOwnership = item.ownership
        self.selectedFunctionalCategory = item.functionalCategory
        self.isEssential = item.necessity == .universalEssential
        self.isPacked = item.isPacked
    }

    // MARK: - Actions

    func buildItem() -> GearItem? {
        guard let qty = Int(quantity), isSaveEnabled else { return nil }
        return GearItem(
            id: itemID ?? UUID(),
            name: name.trimmingCharacters(in: .whitespaces),
            quantity: qty,
            unit: selectedUnit,
            ownership: selectedOwnership,
            functionalCategory: selectedFunctionalCategory,
            zoneCategory: selectedFunctionalCategory.defaultZone, // auto-assigned
            necessity: isEssential ? .universalEssential : .optional,
            isPacked: isPacked
        )
    }
}
