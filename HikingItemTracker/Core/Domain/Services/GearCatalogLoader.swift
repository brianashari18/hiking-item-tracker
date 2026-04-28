//
//  GearCatalogLoader.swift
//  HikingItemTracker
//
//  Created by Antigravity on 28/04/26.
//

import Foundation

struct GearCatalogLoader {
    static func loadAll() -> [GearItemDTO] {
        guard
            let url = Bundle.main.url(forResource: "GearCatalog", withExtension: "json"),
            let data = try? Data(contentsOf: url),
            let catalog = try? JSONDecoder().decode(GearCatalogDTO.self, from: data)
        else {
            assertionFailure("GearCatalog.json tidak ditemukan atau formatnya salah")
            return []
        }
        return catalog.items
    }
    
    static func standardItems(
        for category: ItemFunctionalCategory,
        duration: Int,
        numberOfPeople: Int
    ) -> [GearItem] {
        loadAll()
            .filter { $0.functionalCategory == category }
            .filter {
                switch $0.necessity {
                case .universalEssential, .optional: return true
                case .conditional:                   return false
                }
            }
            .map { $0.toGearItem(duration: duration, numberOfPeople: numberOfPeople) }
    }
    
    static func conditionalItems(
        for mountain: Mountain,
        duration: Int,
        numberOfPeople: Int
    ) -> [GearItem] {
        let mountainTypes = Set(mountain.type)
        return loadAll()
            .filter { $0.necessity == .conditional }
            .filter { dto in
                dto.requiredTypes.contains { mountainTypes.contains($0) }
            }
            .map { $0.toGearItem(duration: duration, numberOfPeople: numberOfPeople) }
    }
}
