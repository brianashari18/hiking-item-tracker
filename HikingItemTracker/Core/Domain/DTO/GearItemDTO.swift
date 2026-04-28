//
//  GearItemDTO.swift
//  HikingItemTracker
//
//  Created by Brian Anashari on 28/04/26.
//

import Foundation

// MARK: - Key Maps (JSON camelCase/lowercase → Swift enum)
// Dipisah agar QuantityFormula & NecessityTemplate tetap di Enums/

private let ownershipMap: [String: ItemOwnership] = [
    "pribadi":  .pribadi,
    "kelompok": .kelompok,
    "sewaan":   .sewaan
]

private let categoryMap: [String: ItemFunctionalCategory] = [
    "specialGear":      .specialGear,
    "shelter":          .shelter,
    "personalItem":     .personalItem,
    "logisticAndFood":  .logisticAndFood,
    "safetyTools":      .safetyTools,
    "medicalKit":       .medicalKit
]

private let zoneMap: [String: ItemZoneCategory] = [
    "bottom":       .bottom,
    "lowerMiddle":  .lowerMiddle,
    "upperMiddle":  .upperMiddle,
    "top":          .top,
    "outer":        .outer
]

// MARK: - GearItemDTO

struct GearItemDTO: Codable {
    let name: String
    let unit: ItemUnit
    let ownership: ItemOwnership
    let functionalCategory: ItemFunctionalCategory
    let zoneCategory: ItemZoneCategory
    let necessity: NecessityTemplate
    let requiredTypes: [MountainType]
    let quantityFormula: QuantityFormula
    let baseQuantity: Int

    private enum CodingKeys: String, CodingKey {
        case name, unit, ownership, functionalCategory, zoneCategory
        case necessity, requiredTypes, quantityFormula, baseQuantity
    }

    init(from decoder: Decoder) throws {
        let c = try decoder.container(keyedBy: CodingKeys.self)

        name            = try c.decode(String.self, forKey: .name)
        necessity       = try c.decode(NecessityTemplate.self, forKey: .necessity)
        requiredTypes   = (try? c.decode([MountainType].self, forKey: .requiredTypes)) ?? []
        quantityFormula = try c.decode(QuantityFormula.self, forKey: .quantityFormula)
        baseQuantity    = try c.decode(Int.self, forKey: .baseQuantity)

        // ItemUnit — rawValue langsung cocok ("pcs", "set", "pasang", dll)
        let unitStr = try c.decode(String.self, forKey: .unit)
        guard let decodedUnit = ItemUnit(rawValue: unitStr) else {
            throw DecodingError.dataCorruptedError(forKey: .unit, in: c, debugDescription: "Unknown unit: \(unitStr)")
        }
        unit = decodedUnit

        // ItemOwnership — key map: "pribadi" → .pribadi (rawValue = "Pribadi")
        let ownershipStr = try c.decode(String.self, forKey: .ownership)
        guard let decodedOwnership = ownershipMap[ownershipStr] else {
            throw DecodingError.dataCorruptedError(forKey: .ownership, in: c, debugDescription: "Unknown ownership: \(ownershipStr)")
        }
        ownership = decodedOwnership

        // ItemFunctionalCategory — key map: "shelter" → .shelter (rawValue = "Shelter")
        let categoryStr = try c.decode(String.self, forKey: .functionalCategory)
        guard let decodedCategory = categoryMap[categoryStr] else {
            throw DecodingError.dataCorruptedError(forKey: .functionalCategory, in: c, debugDescription: "Unknown functionalCategory: \(categoryStr)")
        }
        functionalCategory = decodedCategory

        // ItemZoneCategory — key map: "bottom" → .bottom (rawValue = "Zona Bawah")
        let zoneStr = try c.decode(String.self, forKey: .zoneCategory)
        guard let decodedZone = zoneMap[zoneStr] else {
            throw DecodingError.dataCorruptedError(forKey: .zoneCategory, in: c, debugDescription: "Unknown zoneCategory: \(zoneStr)")
        }
        zoneCategory = decodedZone
    }

    func encode(to encoder: Encoder) throws {
        var c = encoder.container(keyedBy: CodingKeys.self)
        try c.encode(name, forKey: .name)
        try c.encode(unit.rawValue, forKey: .unit)
        try c.encode(ownershipMap.first(where: { $0.value == ownership })?.key ?? "", forKey: .ownership)
        try c.encode(categoryMap.first(where: { $0.value == functionalCategory })?.key ?? "", forKey: .functionalCategory)
        try c.encode(zoneMap.first(where: { $0.value == zoneCategory })?.key ?? "", forKey: .zoneCategory)
        try c.encode(necessity, forKey: .necessity)
        try c.encode(requiredTypes, forKey: .requiredTypes)
        try c.encode(quantityFormula, forKey: .quantityFormula)
        try c.encode(baseQuantity, forKey: .baseQuantity)
    }

    // MARK: - Map ke Domain Model

    func toGearItem(duration: Int, numberOfPeople: Int) -> GearItem {
        GearItem(
            name: name,
            quantity: quantityFormula.calculate(base: baseQuantity, duration: duration, numberOfPeople: numberOfPeople),
            unit: unit,
            ownership: ownership,
            functionalCategory: functionalCategory,
            zoneCategory: zoneCategory,
            necessity: necessity.toGearNecessity(requiredTypes: requiredTypes)
        )
    }
}

// MARK: - Root JSON Wrapper

struct GearCatalogDTO: Codable {
    let items: [GearItemDTO]
}
