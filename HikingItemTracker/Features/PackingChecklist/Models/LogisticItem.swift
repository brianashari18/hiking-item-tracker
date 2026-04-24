//
//  LogisticItem.swift
//  HikingItemTracker
//
//  Created by Brian Anashari on 19/04/26.
//

import Foundation

struct LogisticItem: Identifiable, Equatable {
    let id: UUID
    var name: String
    var quantity: Int
    var unit: ItemUnit
    var ownership: ItemOwnership
    var functionalCategory: ItemFunctionalCategory
    var zoneCategory: ItemZoneCategory
    var isEssential: Bool
    var isPacked: Bool

    init(
        id: UUID = UUID(),
        name: String,
        quantity: Int,
        unit: ItemUnit = .pcs,
        ownership: ItemOwnership = .pribadi,
        functionalCategory: ItemFunctionalCategory = .personalItem,
        zoneCategory: ItemZoneCategory = .bottom,
        isEssential: Bool = false,
        isPacked: Bool = false
    ) {
        self.id = id
        self.name = name
        self.quantity = quantity
        self.unit = unit
        self.ownership = ownership
        self.functionalCategory = functionalCategory
        self.zoneCategory = zoneCategory
        self.isEssential = isEssential
        self.isPacked = isPacked
    }
}
