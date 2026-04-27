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
        duration: 3,
        numberOfPeople: 1,
        sections: [
            // MARK: - Shelter
            LogisticSectionModel(
                categoryType: .functional(.shelter),
                items: [
                    GearItem(name: "Sleeping Bag", quantity: 1, unit: .pcs, ownership: .pribadi, functionalCategory: .shelter, zoneCategory: .bottom, necessity: .universalEssential, isPacked: false),
                    GearItem(name: "Pasak", quantity: 1, unit: .set, ownership: .kelompok, functionalCategory: .shelter, zoneCategory: .outer, necessity: .universalEssential, isPacked: false),
                    GearItem(name: "Matras", quantity: 1, unit: .pcs, ownership: .pribadi, functionalCategory: .shelter, zoneCategory: .bottom, necessity: .universalEssential, isPacked: false),
                    GearItem(name: "Rangka Tenda", quantity: 1, unit: .set, ownership: .kelompok, functionalCategory: .shelter, zoneCategory: .outer, necessity: .universalEssential, isPacked: false),
                    GearItem(name: "Flysheet", quantity: 1, unit: .set, ownership: .kelompok, functionalCategory: .shelter, zoneCategory: .outer, necessity: .universalEssential, isPacked: false),
                    GearItem(name: "Tali Tenda", quantity: 1, unit: .set, ownership: .kelompok, functionalCategory: .shelter, zoneCategory: .outer, necessity: .universalEssential, isPacked: false),
                ]
            ),

            // MARK: - Barang Pribadi
            LogisticSectionModel(
                categoryType: .functional(.personalItem),
                items: [
                    GearItem(name: "Sepatu Gunung", quantity: 1, unit: .pair, ownership: .pribadi, functionalCategory: .personalItem, zoneCategory: .outer, necessity: .universalEssential, isPacked: false),
                    GearItem(name: "Kaos Kaki", quantity: 2, unit: .pair, ownership: .pribadi, functionalCategory: .personalItem, zoneCategory: .lowerMiddle, necessity: .universalEssential, isPacked: false),
                    GearItem(name: "Jaket Gunung", quantity: 1, unit: .pcs, ownership: .pribadi, functionalCategory: .personalItem, zoneCategory: .upperMiddle, necessity: .universalEssential, isPacked: false),
                    GearItem(name: "Pakaian Layering", quantity: 1, unit: .set, ownership: .pribadi, functionalCategory: .personalItem, zoneCategory: .lowerMiddle, necessity: .universalEssential, isPacked: false),
                    GearItem(name: "Jas Hujan", quantity: 1, unit: .pcs, ownership: .pribadi, functionalCategory: .personalItem, zoneCategory: .outer, necessity: .universalEssential, isPacked: false),
                    GearItem(name: "Sarung Tangan", quantity: 1, unit: .pcs, ownership: .pribadi, functionalCategory: .personalItem, zoneCategory: .upperMiddle, necessity: .universalEssential, isPacked: false),
                    GearItem(name: "KTP", quantity: 1, unit: .pcs, ownership: .pribadi, functionalCategory: .personalItem, zoneCategory: .top, necessity: .universalEssential, isPacked: false),
                    GearItem(name: "Surat Izin Pendakian", quantity: 1, unit: .pcs, ownership: .pribadi, functionalCategory: .personalItem, zoneCategory: .top, necessity: .universalEssential, isPacked: false),
                    GearItem(name: "Masker", quantity: 1, unit: .pcs, ownership: .pribadi, functionalCategory: .personalItem, zoneCategory: .top, necessity: .conditional([.volcanic, .sandy, .foggy]), isPacked: false),
                    GearItem(name: "Sandal", quantity: 1, unit: .pair, ownership: .pribadi, functionalCategory: .personalItem, zoneCategory: .outer, necessity: .optional, isPacked: false),
                    GearItem(name: "Sunscreen", quantity: 1, unit: .pcs, ownership: .pribadi, functionalCategory: .personalItem, zoneCategory: .top, necessity: .optional, isPacked: false),
                    GearItem(name: "Peralatan Mandi", quantity: 1, unit: .set, ownership: .pribadi, functionalCategory: .personalItem, zoneCategory: .outer, necessity: .optional, isPacked: false),
                    GearItem(name: "Baju Ganti", quantity: 2, unit: .pcs, ownership: .pribadi, functionalCategory: .personalItem, zoneCategory: .lowerMiddle, necessity: .universalEssential, isPacked: false),
                    GearItem(name: "Celana Ganti", quantity: 2, unit: .pcs, ownership: .pribadi, functionalCategory: .personalItem, zoneCategory: .lowerMiddle, necessity: .universalEssential, isPacked: false),
                    GearItem(name: "Topi", quantity: 1, unit: .pcs, ownership: .pribadi, functionalCategory: .personalItem, zoneCategory: .top, necessity: .optional, isPacked: false),
                    GearItem(name: "Sunblock", quantity: 1, unit: .pcs, ownership: .pribadi, functionalCategory: .personalItem, zoneCategory: .top, necessity: .optional, isPacked: false),
                ]
            ),

            // MARK: - Logistik & Makanan
            LogisticSectionModel(
                categoryType: .functional(.logisticAndFood),
                items: [
                    GearItem(name: "Nesting", quantity: 1, unit: .set, ownership: .kelompok, functionalCategory: .logisticAndFood, zoneCategory: .bottom, necessity: .universalEssential, isPacked: false),
                    GearItem(name: "Korek Api", quantity: 1, unit: .pcs, ownership: .kelompok, functionalCategory: .logisticAndFood, zoneCategory: .top, necessity: .universalEssential, isPacked: false),
                    GearItem(name: "Botol Air", quantity: 1, unit: .pcs, ownership: .pribadi, functionalCategory: .logisticAndFood, zoneCategory: .outer, necessity: .universalEssential, isPacked: false),
                    GearItem(name: "Makanan Ringan", quantity: 9, unit: .pcs, ownership: .pribadi, functionalCategory: .logisticAndFood, zoneCategory: .upperMiddle, necessity: .universalEssential, isPacked: false),
                    GearItem(name: "Makanan Berat", quantity: 9, unit: .pcs, ownership: .kelompok, functionalCategory: .logisticAndFood, zoneCategory: .upperMiddle, necessity: .universalEssential, isPacked: false),
                    GearItem(name: "Gas Kaleng", quantity: 3, unit: .pcs, ownership: .kelompok, functionalCategory: .logisticAndFood, zoneCategory: .bottom, necessity: .universalEssential, isPacked: false),
                    GearItem(name: "Filter Air Portable", quantity: 1, unit: .pcs, ownership: .kelompok, functionalCategory: .logisticAndFood, zoneCategory: .outer, necessity: .universalEssential, isPacked: false),
                    GearItem(name: "Alat Makan", quantity: 1, unit: .set, ownership: .pribadi, functionalCategory: .logisticAndFood, zoneCategory: .top, necessity: .universalEssential, isPacked: false),
                ]
            ),

            // MARK: - Safety Tools
            LogisticSectionModel(
                categoryType: .functional(.safetyTools),
                items: [
                    GearItem(name: "Headlamp", quantity: 1, unit: .pcs, ownership: .pribadi, functionalCategory: .safetyTools, zoneCategory: .top, necessity: .universalEssential, isPacked: false),
                    GearItem(name: "Tali Prusik", quantity: 1, unit: .pcs, ownership: .pribadi, functionalCategory: .safetyTools, zoneCategory: .outer, necessity: .conditional([.climbing, .steep]), isPacked: false),
                    GearItem(name: "Alat Jahit", quantity: 1, unit: .set, ownership: .kelompok, functionalCategory: .safetyTools, zoneCategory: .top, necessity: .optional, isPacked: false),
                    GearItem(name: "Trekking Pole", quantity: 1, unit: .pcs, ownership: .pribadi, functionalCategory: .safetyTools, zoneCategory: .outer, necessity: .conditional([.steep, .slippery, .rocky]), isPacked: false),
                    GearItem(name: "Pisau Lipat", quantity: 1, unit: .pcs, ownership: .kelompok, functionalCategory: .safetyTools, zoneCategory: .top, necessity: .universalEssential, isPacked: false),
                    GearItem(name: "Peta", quantity: 1, unit: .pcs, ownership: .kelompok, functionalCategory: .safetyTools, zoneCategory: .top, necessity: .optional, isPacked: false),
                    GearItem(name: "Kompas", quantity: 1, unit: .pcs, ownership: .kelompok, functionalCategory: .safetyTools, zoneCategory: .top, necessity: .optional, isPacked: false),
                ]
            ),

            // MARK: - P3K
            LogisticSectionModel(
                categoryType: .functional(.medicalKit),
                items: [
                    GearItem(name: "Gulungan Kasa Steril", quantity: 1, unit: .pcs, ownership: .kelompok, functionalCategory: .medicalKit, zoneCategory: .top, necessity: .universalEssential, isPacked: false),
                    GearItem(name: "Pembersih Dasar Alkohol", quantity: 1, unit: .pcs, ownership: .kelompok, functionalCategory: .medicalKit, zoneCategory: .top, necessity: .universalEssential, isPacked: false),
                    GearItem(name: "Pinset", quantity: 1, unit: .pcs, ownership: .kelompok, functionalCategory: .medicalKit, zoneCategory: .top, necessity: .universalEssential, isPacked: false),
                    GearItem(name: "Salep Antiseptik", quantity: 1, unit: .pcs, ownership: .kelompok, functionalCategory: .medicalKit, zoneCategory: .top, necessity: .universalEssential, isPacked: false),
                    GearItem(name: "Perban Elastis", quantity: 1, unit: .pcs, ownership: .kelompok, functionalCategory: .medicalKit, zoneCategory: .top, necessity: .universalEssential, isPacked: false),
                    GearItem(name: "Sarung Tangan Lateks", quantity: 2, unit: .pair, ownership: .kelompok, functionalCategory: .medicalKit, zoneCategory: .top, necessity: .universalEssential, isPacked: false),
                    GearItem(name: "Ibuprofen & Antihistamin", quantity: 1, unit: .set, ownership: .kelompok, functionalCategory: .medicalKit, zoneCategory: .top, necessity: .universalEssential, isPacked: false),
                    GearItem(name: "Bubuk Elektrolit", quantity: 5, unit: .pcs, ownership: .kelompok, functionalCategory: .medicalKit, zoneCategory: .top, necessity: .universalEssential, isPacked: false),
                    GearItem(name: "Minyak Kayu Putih", quantity: 1, unit: .pcs, ownership: .kelompok, functionalCategory: .medicalKit, zoneCategory: .top, necessity: .universalEssential, isPacked: false),
                    GearItem(name: "Kapas", quantity: 1, unit: .pcs, ownership: .kelompok, functionalCategory: .medicalKit, zoneCategory: .top, necessity: .universalEssential, isPacked: false),
                    GearItem(name: "Plester", quantity: 1, unit: .set, ownership: .kelompok, functionalCategory: .medicalKit, zoneCategory: .top, necessity: .universalEssential, isPacked: false),
                    GearItem(name: "Obat Pribadi", quantity: 1, unit: .set, ownership: .pribadi, functionalCategory: .medicalKit, zoneCategory: .top, necessity: .universalEssential, isPacked: false),
                ]
            )
        ]
    )
}
