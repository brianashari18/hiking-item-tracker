//
//  ChecklistGenerator.swift
//  HikingItemTracker
//
//  Created by Antigravity on 27/04/26.
//

import Foundation

struct ChecklistGenerator {
    static func generateTrip(
        mountain: Mountain,
        tripDate: String,
        duration: Int,
        numberOfPeople: Int
    ) -> HikingTripModel {
        
        let sections = [
            generateShelterSection(numberOfPeople: numberOfPeople),
            generatePersonalSection(mountain: mountain, duration: duration),
            generateFoodSection(duration: duration, numberOfPeople: numberOfPeople),
            generateSafetySection(mountain: mountain),
            generateMedicalSection()
        ]
        
        return HikingTripModel(
            mountainName: mountain.name,
            tripDate: tripDate,
            duration: duration,
            numberOfPeople: numberOfPeople,
            sections: sections
        )
    }
    
    private static func generateShelterSection(numberOfPeople: Int) -> LogisticSectionModel {
        // Items are generally per group or shared
        let items = [
            GearItem(name: "Sleeping Bag", quantity: numberOfPeople, unit: .pcs, ownership: .pribadi, functionalCategory: .shelter, zoneCategory: .bottom, necessity: .universalEssential),
            GearItem(name: "Pasak", quantity: 1, unit: .set, ownership: .kelompok, functionalCategory: .shelter, zoneCategory: .outer, necessity: .universalEssential),
            GearItem(name: "Matras", quantity: numberOfPeople, unit: .pcs, ownership: .pribadi, functionalCategory: .shelter, zoneCategory: .bottom, necessity: .universalEssential),
            GearItem(name: "Rangka Tenda", quantity: 1, unit: .set, ownership: .kelompok, functionalCategory: .shelter, zoneCategory: .outer, necessity: .universalEssential),
            GearItem(name: "Flysheet", quantity: 1, unit: .set, ownership: .kelompok, functionalCategory: .shelter, zoneCategory: .outer, necessity: .universalEssential),
            GearItem(name: "Tali Tenda", quantity: 1, unit: .set, ownership: .kelompok, functionalCategory: .shelter, zoneCategory: .outer, necessity: .universalEssential),
        ]
        return LogisticSectionModel(categoryType: .functional(.shelter), items: items)
    }
    
    private static func generatePersonalSection(mountain: Mountain, duration: Int) -> LogisticSectionModel {
        var items = [
            GearItem(name: "Sepatu Gunung", quantity: 1, unit: .pair, ownership: .pribadi, functionalCategory: .personalItem, zoneCategory: .outer, necessity: .universalEssential),
            GearItem(name: "Kaos Kaki", quantity: 2, unit: .pair, ownership: .pribadi, functionalCategory: .personalItem, zoneCategory: .lowerMiddle, necessity: .universalEssential),
            GearItem(name: "Jaket Gunung", quantity: 1, unit: .pcs, ownership: .pribadi, functionalCategory: .personalItem, zoneCategory: .upperMiddle, necessity: .universalEssential),
            GearItem(name: "Pakaian Layering", quantity: 1, unit: .set, ownership: .pribadi, functionalCategory: .personalItem, zoneCategory: .lowerMiddle, necessity: .universalEssential),
            GearItem(name: "Jas Hujan", quantity: 1, unit: .pcs, ownership: .pribadi, functionalCategory: .personalItem, zoneCategory: .outer, necessity: .universalEssential),
            GearItem(name: "Sarung Tangan", quantity: 1, unit: .pcs, ownership: .pribadi, functionalCategory: .personalItem, zoneCategory: .upperMiddle, necessity: .universalEssential),
            GearItem(name: "KTP", quantity: 1, unit: .pcs, ownership: .pribadi, functionalCategory: .personalItem, zoneCategory: .top, necessity: .universalEssential),
            GearItem(name: "Surat Izin Pendakian", quantity: 1, unit: .pcs, ownership: .pribadi, functionalCategory: .personalItem, zoneCategory: .top, necessity: .universalEssential),
            GearItem(name: "Baju Ganti", quantity: max(0, duration - 1), unit: .pcs, ownership: .pribadi, functionalCategory: .personalItem, zoneCategory: .lowerMiddle, necessity: .universalEssential),
            GearItem(name: "Celana Ganti", quantity: max(0, duration - 1), unit: .pcs, ownership: .pribadi, functionalCategory: .personalItem, zoneCategory: .lowerMiddle, necessity: .universalEssential),
        ]
        
        // Conditional Items
        let mountainTypes = Set(mountain.type)
        
        if mountainTypes.contains(.volcanic) || mountainTypes.contains(.sandy) || mountainTypes.contains(.poisonous) {
            items.append(GearItem(name: "Masker", quantity: 1, unit: .pcs, ownership: .pribadi, functionalCategory: .personalItem, zoneCategory: .top, necessity: .universalEssential))
        }
        
        // Optional Items
        items.append(contentsOf: [
            GearItem(name: "Sandal", quantity: 1, unit: .pair, ownership: .pribadi, functionalCategory: .personalItem, zoneCategory: .outer, necessity: .optional),
            GearItem(name: "Sunscreen", quantity: 1, unit: .pcs, ownership: .pribadi, functionalCategory: .personalItem, zoneCategory: .top, necessity: .optional),
            GearItem(name: "Peralatan Mandi", quantity: 1, unit: .set, ownership: .pribadi, functionalCategory: .personalItem, zoneCategory: .outer, necessity: .optional),
            GearItem(name: "Topi", quantity: 1, unit: .pcs, ownership: .pribadi, functionalCategory: .personalItem, zoneCategory: .top, necessity: .optional),
            GearItem(name: "Sunblock", quantity: 1, unit: .pcs, ownership: .pribadi, functionalCategory: .personalItem, zoneCategory: .top, necessity: .optional),
        ])
        
        return LogisticSectionModel(categoryType: .functional(.personalItem), items: items)
    }
    
    private static func generateFoodSection(duration: Int, numberOfPeople: Int) -> LogisticSectionModel {
        let items = [
            GearItem(name: "Nesting", quantity: 1, unit: .set, ownership: .kelompok, functionalCategory: .logisticAndFood, zoneCategory: .bottom, necessity: .universalEssential),
            GearItem(name: "Korek Api", quantity: 1, unit: .pcs, ownership: .kelompok, functionalCategory: .logisticAndFood, zoneCategory: .top, necessity: .universalEssential),
            GearItem(name: "Botol Air", quantity: 1, unit: .pcs, ownership: .pribadi, functionalCategory: .logisticAndFood, zoneCategory: .outer, necessity: .universalEssential),
            GearItem(name: "Makanan Ringan", quantity: 3 * duration, unit: .pcs, ownership: .pribadi, functionalCategory: .logisticAndFood, zoneCategory: .upperMiddle, necessity: .universalEssential),
            GearItem(name: "Makanan Berat", quantity: 3 * duration, unit: .pcs, ownership: .kelompok, functionalCategory: .logisticAndFood, zoneCategory: .upperMiddle, necessity: .universalEssential),
            GearItem(name: "Gas Kaleng", quantity: duration, unit: .pcs, ownership: .kelompok, functionalCategory: .logisticAndFood, zoneCategory: .bottom, necessity: .universalEssential),
            GearItem(name: "Filter Air Portable", quantity: 1, unit: .pcs, ownership: .kelompok, functionalCategory: .logisticAndFood, zoneCategory: .outer, necessity: .universalEssential),
            GearItem(name: "Alat Makan", quantity: 1, unit: .set, ownership: .pribadi, functionalCategory: .logisticAndFood, zoneCategory: .top, necessity: .universalEssential),
        ]
        return LogisticSectionModel(categoryType: .functional(.logisticAndFood), items: items)
    }
    
    private static func generateSafetySection(mountain: Mountain) -> LogisticSectionModel {
        var items = [
            GearItem(name: "Headlamp", quantity: 1, unit: .pcs, ownership: .pribadi, functionalCategory: .safetyTools, zoneCategory: .top, necessity: .universalEssential),
            GearItem(name: "Pisau Lipat", quantity: 1, unit: .pcs, ownership: .kelompok, functionalCategory: .safetyTools, zoneCategory: .top, necessity: .universalEssential),
        ]
        
        let mountainTypes = Set(mountain.type)
        
        if mountainTypes.contains(.climbing) || mountainTypes.contains(.steep) {
            items.append(GearItem(name: "Tali Prusik", quantity: 1, unit: .pcs, ownership: .pribadi, functionalCategory: .safetyTools, zoneCategory: .outer, necessity: .universalEssential))
        }
        
        if mountainTypes.contains(.steep) || mountainTypes.contains(.slippery) || mountainTypes.contains(.rocky) {
            items.append(GearItem(name: "Trekking Pole", quantity: 1, unit: .pcs, ownership: .pribadi, functionalCategory: .safetyTools, zoneCategory: .outer, necessity: .universalEssential))
        }
        
        items.append(contentsOf: [
            GearItem(name: "Alat Jahit", quantity: 1, unit: .set, ownership: .kelompok, functionalCategory: .safetyTools, zoneCategory: .top, necessity: .optional),
            GearItem(name: "Peta", quantity: 1, unit: .pcs, ownership: .kelompok, functionalCategory: .safetyTools, zoneCategory: .top, necessity: .optional),
            GearItem(name: "Kompas", quantity: 1, unit: .pcs, ownership: .kelompok, functionalCategory: .safetyTools, zoneCategory: .top, necessity: .optional),
        ])
        
        return LogisticSectionModel(categoryType: .functional(.safetyTools), items: items)
    }
    
    private static func generateMedicalSection() -> LogisticSectionModel {
        let items = [
            GearItem(name: "Gulungan Kasa Steril", quantity: 1, unit: .pcs, ownership: .kelompok, functionalCategory: .medicalKit, zoneCategory: .top, necessity: .universalEssential),
            GearItem(name: "Pembersih Dasar Alkohol", quantity: 1, unit: .pcs, ownership: .kelompok, functionalCategory: .medicalKit, zoneCategory: .top, necessity: .universalEssential),
            GearItem(name: "Pinset", quantity: 1, unit: .pcs, ownership: .kelompok, functionalCategory: .medicalKit, zoneCategory: .top, necessity: .universalEssential),
            GearItem(name: "Salep Antiseptik", quantity: 1, unit: .pcs, ownership: .kelompok, functionalCategory: .medicalKit, zoneCategory: .top, necessity: .universalEssential),
            GearItem(name: "Perban Elastis", quantity: 1, unit: .pcs, ownership: .kelompok, functionalCategory: .medicalKit, zoneCategory: .top, necessity: .universalEssential),
            GearItem(name: "Sarung Tangan Lateks", quantity: 2, unit: .pair, ownership: .kelompok, functionalCategory: .medicalKit, zoneCategory: .top, necessity: .universalEssential),
            GearItem(name: "Ibuprofen & Antihistamin", quantity: 1, unit: .set, ownership: .kelompok, functionalCategory: .medicalKit, zoneCategory: .top, necessity: .universalEssential),
            GearItem(name: "Bubuk Elektrolit", quantity: 5, unit: .pcs, ownership: .kelompok, functionalCategory: .medicalKit, zoneCategory: .top, necessity: .universalEssential),
            GearItem(name: "Minyak Kayu Putih", quantity: 1, unit: .pcs, ownership: .kelompok, functionalCategory: .medicalKit, zoneCategory: .top, necessity: .universalEssential),
            GearItem(name: "Kapas", quantity: 1, unit: .pcs, ownership: .kelompok, functionalCategory: .medicalKit, zoneCategory: .top, necessity: .universalEssential),
            GearItem(name: "Plester", quantity: 1, unit: .set, ownership: .kelompok, functionalCategory: .medicalKit, zoneCategory: .top, necessity: .universalEssential),
            GearItem(name: "Obat Pribadi", quantity: 1, unit: .set, ownership: .pribadi, functionalCategory: .medicalKit, zoneCategory: .top, necessity: .universalEssential),
        ]
        return LogisticSectionModel(categoryType: .functional(.medicalKit), items: items)
    }
}
