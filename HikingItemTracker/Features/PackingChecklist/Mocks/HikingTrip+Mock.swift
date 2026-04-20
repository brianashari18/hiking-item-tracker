//
//  HikingTripModel+Mock.swift
//  HikingItemTracker
//
//  Created by Brian Anashari on 19/04/26.
//

import Foundation

extension HikingTripModel {
    static let mock = HikingTripModel(
        mountainName: "Gunung Rinjani",
        tripDate: "24 November 2027",
        sections: [
            // MARK: - Perlengkapan Tenda
            LogisticSectionModel(
                categoryType: .functional(.tentEquipment),
                items: [
                    LogisticItem(name: "Tenda Dome 4P", quantity: 1, unit: .pcs, ownership: .kelompok,
                                 functionalCategory: .tentEquipment, zoneCategory: .bottom, isEssential: true, isPacked: true),
                    LogisticItem(name: "Terpal Groundsheet", quantity: 1, unit: .pcs, ownership: .kelompok,
                                 functionalCategory: .tentEquipment, zoneCategory: .bottom, isEssential: true, isPacked: false),
                    LogisticItem(name: "Pasak Tenda Cadangan", quantity: 10, unit: .pcs, ownership: .pribadi,
                                 functionalCategory: .tentEquipment, zoneCategory: .outer, isEssential: false, isPacked: false),
                    LogisticItem(name: "Tali Guyline", quantity: 5, unit: .pcs, ownership: .kelompok,
                                 functionalCategory: .tentEquipment, zoneCategory: .outer, isEssential: false, isPacked: false),
                ]
            ),

            // MARK: - Perlengkapan Tidur
            LogisticSectionModel(
                categoryType: .functional(.sleepingEquipment),
                items: [
                    LogisticItem(name: "Sleeping Bag -5°C", quantity: 1, unit: .pcs, ownership: .pribadi,
                                 functionalCategory: .sleepingEquipment, zoneCategory: .bottom, isEssential: true, isPacked: true),
                    LogisticItem(name: "Sleeping Pad / Matras", quantity: 1, unit: .pcs, ownership: .pribadi,
                                 functionalCategory: .sleepingEquipment, zoneCategory: .bottom, isEssential: true, isPacked: false),
                    LogisticItem(name: "Sarung Tangan Tidur", quantity: 1, unit: .pcs, ownership: .pribadi,
                                 functionalCategory: .sleepingEquipment, zoneCategory: .upperMiddle, isEssential: false, isPacked: false),
                    LogisticItem(name: "Balaclava", quantity: 1, unit: .pcs, ownership: .pribadi,
                                 functionalCategory: .sleepingEquipment, zoneCategory: .upperMiddle, isEssential: false, isPacked: true),
                ]
            ),

            // MARK: - Perlengkapan Pakaian
            LogisticSectionModel(
                categoryType: .functional(.clothingEquipment),
                items: [
                    LogisticItem(name: "Base Layer Thermal", quantity: 2, unit: .pcs, ownership: .pribadi,
                                 functionalCategory: .clothingEquipment, zoneCategory: .upperMiddle, isEssential: true, isPacked: true),
                    LogisticItem(name: "Celana Trekking", quantity: 2, unit: .pcs, ownership: .pribadi,
                                 functionalCategory: .clothingEquipment, zoneCategory: .lowerMiddle, isEssential: true, isPacked: false),
                    LogisticItem(name: "Raincoat / Poncho", quantity: 1, unit: .pcs, ownership: .pribadi,
                                 functionalCategory: .clothingEquipment, zoneCategory: .outer, isEssential: true, isPacked: false),
                    LogisticItem(name: "Kaos Kaki Wool", quantity: 3, unit: .pcs, ownership: .pribadi,
                                 functionalCategory: .clothingEquipment, zoneCategory: .lowerMiddle, isEssential: true, isPacked: false),
                    LogisticItem(name: "Gaiters", quantity: 1, unit: .pcs, ownership: .pribadi,
                                 functionalCategory: .clothingEquipment, zoneCategory: .outer, isEssential: false, isPacked: false),
                    LogisticItem(name: "Sarung Tangan", quantity: 1, unit: .pcs, ownership: .pribadi,
                                 functionalCategory: .clothingEquipment, zoneCategory: .upperMiddle, isEssential: true, isPacked: true),
                    LogisticItem(name: "Buff / Neck Gaiter", quantity: 1, unit: .pcs, ownership: .pribadi,
                                 functionalCategory: .clothingEquipment, zoneCategory: .upperMiddle, isEssential: false, isPacked: false),
                ]
            ),

            // MARK: - Perlengkapan Memasak
            LogisticSectionModel(
                categoryType: .functional(.cookingEquipment),
                items: [
                    LogisticItem(name: "Kompor Portable", quantity: 1, unit: .pcs, ownership: .sewaan,
                                 functionalCategory: .cookingEquipment, zoneCategory: .bottom, isEssential: true, isPacked: false),
                    LogisticItem(name: "Gas Kompor 230gr", quantity: 2, unit: .pcs, ownership: .kelompok,
                                 functionalCategory: .cookingEquipment, zoneCategory: .bottom, isEssential: true, isPacked: false),
                    LogisticItem(name: "Nesting / Panci Set", quantity: 1, unit: .pcs, ownership: .sewaan,
                                 functionalCategory: .cookingEquipment, zoneCategory: .bottom, isEssential: true, isPacked: false),
                    LogisticItem(name: "Spatула / Sendok Masak", quantity: 1, unit: .pcs, ownership: .kelompok,
                                 functionalCategory: .cookingEquipment, zoneCategory: .bottom, isEssential: false, isPacked: false),
                    LogisticItem(name: "Wind Shield Kompor", quantity: 1, unit: .pcs, ownership: .kelompok,
                                 functionalCategory: .cookingEquipment, zoneCategory: .bottom, isEssential: false, isPacked: false),
                ]
            ),

            // MARK: - Perlengkapan Logistik dan Konsumsi
            LogisticSectionModel(
                categoryType: .functional(.logisticsAndConsumption),
                items: [
                    LogisticItem(name: "Beras", quantity: 2, unit: .kg, ownership: .kelompok,
                                 functionalCategory: .logisticsAndConsumption, zoneCategory: .bottom, isEssential: true, isPacked: false),
                    LogisticItem(name: "Mie Instan", quantity: 10, unit: .pcs, ownership: .kelompok,
                                 functionalCategory: .logisticsAndConsumption, zoneCategory: .bottom, isEssential: true, isPacked: true),
                    LogisticItem(name: "Energen / Oatmeal", quantity: 5, unit: .pcs, ownership: .pribadi,
                                 functionalCategory: .logisticsAndConsumption, zoneCategory: .upperMiddle, isEssential: false, isPacked: false),
                    LogisticItem(name: "Air Mineral 1.5L", quantity: 2, unit: .pcs, ownership: .pribadi,
                                 functionalCategory: .logisticsAndConsumption, zoneCategory: .outer, isEssential: true, isPacked: false),
                    LogisticItem(name: "Snack Coklat / Energy Bar", quantity: 5, unit: .pcs, ownership: .pribadi,
                                 functionalCategory: .logisticsAndConsumption, zoneCategory: .upperMiddle, isEssential: false, isPacked: true),
                    LogisticItem(name: "Gula Aren / Madu", quantity: 1, unit: .pcs, ownership: .kelompok,
                                 functionalCategory: .logisticsAndConsumption, zoneCategory: .upperMiddle, isEssential: false, isPacked: false),
                ]
            ),

            // MARK: - Kesehatan dan Sanitasi
            LogisticSectionModel(
                categoryType: .functional(.healthAndSanitation),
                items: [
                    LogisticItem(name: "P3K Kit", quantity: 1, unit: .pcs, ownership: .kelompok,
                                 functionalCategory: .healthAndSanitation, zoneCategory: .upperMiddle, isEssential: true, isPacked: false),
                    LogisticItem(name: "Obat Anti Mabuk", quantity: 5, unit: .pcs, ownership: .pribadi,
                                 functionalCategory: .healthAndSanitation, zoneCategory: .upperMiddle, isEssential: false, isPacked: false),
                    LogisticItem(name: "Sunscreen SPF 50+", quantity: 1, unit: .pcs, ownership: .pribadi,
                                 functionalCategory: .healthAndSanitation, zoneCategory: .upperMiddle, isEssential: true, isPacked: true),
                    LogisticItem(name: "Hand Sanitizer 100ml", quantity: 1, unit: .ml, ownership: .pribadi,
                                 functionalCategory: .healthAndSanitation, zoneCategory: .outer, isEssential: true, isPacked: false),
                    LogisticItem(name: "Tisu Basah", quantity: 2, unit: .pcs, ownership: .pribadi,
                                 functionalCategory: .healthAndSanitation, zoneCategory: .outer, isEssential: false, isPacked: true),
                    LogisticItem(name: "Paracetamol 500mg", quantity: 6, unit: .pcs, ownership: .pribadi,
                                 functionalCategory: .healthAndSanitation, zoneCategory: .upperMiddle, isEssential: true, isPacked: false),
                    LogisticItem(name: "Plester / Kinesio Tape", quantity: 10, unit: .pcs, ownership: .pribadi,
                                 functionalCategory: .healthAndSanitation, zoneCategory: .upperMiddle, isEssential: true, isPacked: false),
                ]
            ),

            // MARK: - Perlengkapan Tambahan
            LogisticSectionModel(
                categoryType: .functional(.additionalEquipment),
                items: [
                    LogisticItem(name: "Headlamp + Baterai", quantity: 1, unit: .pcs, ownership: .pribadi,
                                 functionalCategory: .additionalEquipment, zoneCategory: .outer, isEssential: true, isPacked: true),
                    LogisticItem(name: "Trekking Pole", quantity: 2, unit: .pcs, ownership: .sewaan,
                                 functionalCategory: .additionalEquipment, zoneCategory: .outer, isEssential: false, isPacked: false),
                    LogisticItem(name: "Powerbank 20.000mAh", quantity: 1, unit: .pcs, ownership: .pribadi,
                                 functionalCategory: .additionalEquipment, zoneCategory: .upperMiddle, isEssential: true, isPacked: false),
                    LogisticItem(name: "Rain Cover Carrier", quantity: 1, unit: .pcs, ownership: .pribadi,
                                 functionalCategory: .additionalEquipment, zoneCategory: .outer, isEssential: true, isPacked: false),
                    LogisticItem(name: "Peluit Darurat", quantity: 1, unit: .pcs, ownership: .pribadi,
                                 functionalCategory: .additionalEquipment, zoneCategory: .outer, isEssential: true, isPacked: true),
                    LogisticItem(name: "Trash Bag 80L", quantity: 2, unit: .pcs, ownership: .kelompok,
                                 functionalCategory: .additionalEquipment, zoneCategory: .outer, isEssential: false, isPacked: false),
                    LogisticItem(name: "Carabiner Clip", quantity: 3, unit: .pcs, ownership: .pribadi,
                                 functionalCategory: .additionalEquipment, zoneCategory: .outer, isEssential: false, isPacked: false),
                ]
            ),
        ]
    )
}
