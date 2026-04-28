//
//  ChecklistGenerator.swift
//  HikingItemTracker
//
//  Created by Brian Anashari on 27/04/26.
//

import Foundation

struct ChecklistGenerator {
    static func generateTrip(
        mountain: Mountain,
        tripDate: String,
        duration: Int,
        numberOfPeople: Int
    ) -> HikingTripModel {

        var sections: [LogisticSectionModel] = []

        // ── Special Gear (Mountain-Specific) ──────────────────────────────
        let specialItems = GearCatalogLoader.conditionalItems(
            for: mountain,
            duration: duration,
            numberOfPeople: numberOfPeople
        )
        if !specialItems.isEmpty {
            sections.append(LogisticSectionModel(
                categoryType: .functional(.specialGear),
                items: specialItems
            ))
        }

        // ── Standard Categories ───────────────────────────────────────────
        let standardCategories: [ItemFunctionalCategory] = [
            .shelter, .personalItem, .logisticAndFood, .safetyTools, .medicalKit
        ]

        for category in standardCategories {
            let items = GearCatalogLoader.standardItems(
                for: category,
                duration: duration,
                numberOfPeople: numberOfPeople
            )
            if !items.isEmpty {
                sections.append(LogisticSectionModel(
                    categoryType: .functional(category),
                    items: items
                ))
            }
        }

        return HikingTripModel(
            mountain: mountain,
            tripDate: tripDate,
            duration: duration,
            numberOfPeople: numberOfPeople,
            sections: sections
        )
    }
}
