//
//  ChecklistGenerator.swift
//  HikingItemTracker
//
//  Created by Brian Anashari on 20/04/26.
//

import Foundation

/// Service layer stateless yang men-generate packing checklist secara otomatis
/// berdasarkan metadata gunung (altitude, durasi) dan input user (jumlah orang).
///
/// Dipanggil oleh PackingChecklistViewModel saat pertama kali menerima TripSetupData.
enum ChecklistGenerator {

    // MARK: - Public API

    /// Generate array of LogisticSectionModel dari TripSetupData.
    static func generate(from data: TripSetupData) -> [LogisticSectionModel] {
        var sections: [LogisticSectionModel] = []

        sections.append(clothingSection(data: data))
        sections.append(healthSection())
        sections.append(logisticsSection(data: data))

        if data.mountain.estimatedDurationDays > 1 {
            sections.append(tentSection(data: data))
            sections.append(sleepingSection(data: data))
            sections.append(cookingSection(data: data))
        }

        sections.append(additionalSection(data: data))

        return sections
    }

    // MARK: - Sections

    // MARK: Pakaian
    private static func clothingSection(data: TripSetupData) -> LogisticSectionModel {
        let alt = data.mountain.altitudeCategory
        var items: [LogisticItem] = [
            item("Celana Trekking", qty: 2, cat: .clothingEquipment, zone: .lowerMiddle, essential: true),
            item("Kaos Trekking / Base Layer", qty: 2, cat: .clothingEquipment, zone: .lowerMiddle, essential: true),
            item("Raincoat / Poncho", qty: 1, cat: .clothingEquipment, zone: .outer, essential: true),
            item("Kaos Kaki Wool", qty: data.mountain.estimatedDurationDays + 1,
                 cat: .clothingEquipment, zone: .lowerMiddle, essential: true),
            item("Buff / Neck Gaiter", qty: 1, cat: .clothingEquipment, zone: .upperMiddle),
        ]
        if alt.needsLayering {
            items.append(item("Sarung Tangan", qty: 1, cat: .clothingEquipment, zone: .upperMiddle, essential: true))
            items.append(item("Jaket Fleece / Mid-layer", qty: 1, cat: .clothingEquipment, zone: .upperMiddle, essential: true))
            items.append(item("Gaiters", qty: 1, cat: .clothingEquipment, zone: .outer))
        }
        if alt.needsDownJacket {
            items.append(item("Down Jacket", qty: 1, cat: .clothingEquipment, zone: .upperMiddle, essential: true))
            items.append(item("Balaclava", qty: 1, cat: .clothingEquipment, zone: .upperMiddle, essential: true))
            items.append(item("Sarung Tangan Waterproof", qty: 1, cat: .clothingEquipment, zone: .upperMiddle, essential: true))
        }
        return section(.clothingEquipment, items: items)
    }

    // MARK: Kesehatan & Sanitasi
    private static func healthSection() -> LogisticSectionModel {
        let items: [LogisticItem] = [
            item("P3K Kit", qty: 1, cat: .healthAndSanitation, zone: .upperMiddle, essential: true),
            item("Paracetamol 500mg", qty: 6, cat: .healthAndSanitation, zone: .upperMiddle, essential: true),
            item("Plester / Kinesio Tape", qty: 10, unit: .pcs, cat: .healthAndSanitation, zone: .upperMiddle, essential: true),
            item("Sunscreen SPF 50+", qty: 1, cat: .healthAndSanitation, zone: .upperMiddle, essential: true),
            item("Hand Sanitizer 100ml", qty: 1, unit: .ml, cat: .healthAndSanitation, zone: .outer, essential: true),
            item("Tisu Basah", qty: 2, cat: .healthAndSanitation, zone: .outer),
            item("Obat Anti Mabuk", qty: 5, cat: .healthAndSanitation, zone: .upperMiddle),
        ]
        return section(.healthAndSanitation, items: items)
    }

    // MARK: Logistik & Konsumsi
    private static func logisticsSection(data: TripSetupData) -> LogisticSectionModel {
        let days   = data.mountain.estimatedDurationDays
        let people = data.numberOfPeople
        var items: [LogisticItem] = [
            item("Air Mineral 1.5L", qty: people * 2, cat: .logisticsAndConsumption, zone: .outer, essential: true),
            item("Snack / Energy Bar", qty: days * people, cat: .logisticsAndConsumption, zone: .upperMiddle),
        ]
        if days > 1 {
            items.append(item("Beras", qty: people, unit: .kg, cat: .logisticsAndConsumption, zone: .bottom, essential: true))
            items.append(item("Mie Instan", qty: days * people, cat: .logisticsAndConsumption, zone: .bottom, essential: true))
            items.append(item("Energen / Oatmeal", qty: days * people, cat: .logisticsAndConsumption, zone: .upperMiddle))
            items.append(item("Gula Aren / Madu", qty: 1, cat: .logisticsAndConsumption, zone: .upperMiddle))
        }
        return section(.logisticsAndConsumption, items: items)
    }

    // MARK: Tenda (overnight only)
    private static func tentSection(data: TripSetupData) -> LogisticSectionModel {
        let tents = max(1, Int(ceil(Double(data.numberOfPeople) / 3.0)))
        let items: [LogisticItem] = [
            item("Tenda Dome", qty: tents, cat: .tentEquipment, zone: .bottom, essential: true),
            item("Terpal Groundsheet", qty: tents, cat: .tentEquipment, zone: .bottom, essential: true),
            item("Pasak Tenda Cadangan", qty: 10, cat: .tentEquipment, zone: .outer),
            item("Tali Guyline", qty: 5, cat: .tentEquipment, zone: .outer),
        ]
        return section(.tentEquipment, items: items)
    }

    // MARK: Tidur (overnight only)
    private static func sleepingSection(data: TripSetupData) -> LogisticSectionModel {
        let alt = data.mountain.altitudeCategory
        let people = data.numberOfPeople
        var items: [LogisticItem] = [
            item(alt.sleepingBagRating, qty: people, cat: .sleepingEquipment, zone: .bottom, essential: true),
            item("Sleeping Pad / Matras", qty: people, cat: .sleepingEquipment, zone: .bottom, essential: true),
        ]
        if alt.needsLayering {
            items.append(item("Sarung Tangan Tidur", qty: people, cat: .sleepingEquipment, zone: .upperMiddle))
        }
        if alt.needsDownJacket {
            items.append(item("Balaclava Tidur", qty: people, cat: .sleepingEquipment, zone: .upperMiddle, essential: true))
        }
        return section(.sleepingEquipment, items: items)
    }

    // MARK: Memasak (overnight only)
    private static func cookingSection(data: TripSetupData) -> LogisticSectionModel {
        let stoves = max(1, Int(ceil(Double(data.numberOfPeople) / 4.0)))
        let items: [LogisticItem] = [
            item("Kompor Portable", qty: stoves, ownership: .sewaan, cat: .cookingEquipment, zone: .bottom, essential: true),
            item("Gas Kompor 230gr", qty: stoves * 2, ownership: .kelompok, cat: .cookingEquipment, zone: .bottom, essential: true),
            item("Nesting / Panci Set", qty: stoves, ownership: .sewaan, cat: .cookingEquipment, zone: .bottom, essential: true),
            item("Sendok Masak / Spatula", qty: 1, ownership: .kelompok, cat: .cookingEquipment, zone: .bottom),
            item("Wind Shield Kompor", qty: 1, ownership: .kelompok, cat: .cookingEquipment, zone: .bottom),
        ]
        return section(.cookingEquipment, items: items)
    }

    // MARK: Perlengkapan Tambahan
    private static func additionalSection(data: TripSetupData) -> LogisticSectionModel {
        let alt = data.mountain.altitudeCategory
        var items: [LogisticItem] = [
            item("Headlamp + Baterai Cadangan", qty: data.numberOfPeople,
                 cat: .additionalEquipment, zone: .outer, essential: true),
            item("Powerbank 20.000mAh", qty: 1, cat: .additionalEquipment, zone: .upperMiddle, essential: true),
            item("Rain Cover Carrier", qty: data.numberOfPeople, cat: .additionalEquipment, zone: .outer, essential: true),
            item("Peluit Darurat", qty: data.numberOfPeople, cat: .additionalEquipment, zone: .outer, essential: true),
            item("Trash Bag 80L", qty: 2, ownership: .kelompok, cat: .additionalEquipment, zone: .outer),
            item("Carabiner Clip", qty: 3, cat: .additionalEquipment, zone: .outer),
        ]
        if alt.needsLayering {
            items.append(item("Trekking Pole", qty: data.numberOfPeople * 2, ownership: .sewaan,
                              cat: .additionalEquipment, zone: .outer))
        }
        if alt == .veryHigh {
            items.append(item("Suplemen Altitude / Diamox", qty: data.numberOfPeople * 2,
                              cat: .additionalEquipment, zone: .upperMiddle, essential: true))
        }
        return section(.additionalEquipment, items: items)
    }

    // MARK: - Builder Helpers

    private static func section(_ cat: ItemFunctionalCategory, items: [LogisticItem]) -> LogisticSectionModel {
        LogisticSectionModel(categoryType: .functional(cat), items: items)
    }

    private static func item(
        _ name: String,
        qty: Int,
        unit: ItemUnit = .pcs,
        ownership: ItemOwnership = .pribadi,
        cat: ItemFunctionalCategory,
        zone: ItemZoneCategory,
        essential: Bool = false
    ) -> LogisticItem {
        LogisticItem(
            name: name,
            quantity: qty,
            unit: unit,
            ownership: ownership,
            functionalCategory: cat,
            zoneCategory: zone,
            isEssential: essential,
            isPacked: false
        )
    }
}
