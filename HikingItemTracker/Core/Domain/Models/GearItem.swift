//
//  GearItem.swift
//  HikingItemTracker
//
//  Created by Antigravity on 27/04/26.
//

import Foundation

struct GearItem: Identifiable, Hashable, Equatable {
    let id: UUID
    var name: String
    var quantity: Int
    var unit: ItemUnit
    var ownership: ItemOwnership
    var functionalCategory: ItemFunctionalCategory
    var zoneCategory: ItemZoneCategory
    var necessity: GearNecessity
    var isPacked: Bool

    init(
        id: UUID = UUID(),
        name: String,
        quantity: Int,
        unit: ItemUnit = .pcs,
        ownership: ItemOwnership = .pribadi,
        functionalCategory: ItemFunctionalCategory = .personalItem,
        zoneCategory: ItemZoneCategory = .bottom,
        necessity: GearNecessity = .optional,
        isPacked: Bool = false
    ) {
        self.id = id
        self.name = name
        self.quantity = quantity
        self.unit = unit
        self.ownership = ownership
        self.functionalCategory = functionalCategory
        self.zoneCategory = zoneCategory
        self.necessity = necessity
        self.isPacked = isPacked
    }
}
