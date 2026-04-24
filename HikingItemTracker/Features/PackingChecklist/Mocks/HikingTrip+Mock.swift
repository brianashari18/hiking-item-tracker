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
            // MARK: - Shelter (Tenda & Tidur)
            LogisticSectionModel(
                categoryType: .functional(.shelter),
                items: [
                    LogisticItem(name: "Tenda", quantity: 1, unit: .pcs, ownership: .kelompok, functionalCategory: .shelter, zoneCategory: .bottom, isEssential: true, isPacked: false),
                    LogisticItem(name: "Sleeping Bag", quantity: 1, unit: .pcs, ownership: .pribadi, functionalCategory: .shelter, zoneCategory: .bottom, isEssential: true, isPacked: false),
                    LogisticItem(name: "Matras", quantity: 1, unit: .pcs, ownership: .pribadi, functionalCategory: .shelter, zoneCategory: .bottom, isEssential: true, isPacked: false),
                    LogisticItem(name: "Hammock", quantity: 1, unit: .pcs, ownership: .pribadi, functionalCategory: .shelter, zoneCategory: .bottom, isEssential: false, isPacked: false),
                    LogisticItem(name: "Tali Tenda", quantity: 5, unit: .pcs, ownership: .kelompok, functionalCategory: .shelter, zoneCategory: .outer, isEssential: true, isPacked: false),
                    LogisticItem(name: "Pasak", quantity: 10, unit: .pcs, ownership: .kelompok, functionalCategory: .shelter, zoneCategory: .outer, isEssential: true, isPacked: false),
                    LogisticItem(name: "Rangka Tenda", quantity: 1, unit: .pcs, ownership: .kelompok, functionalCategory: .shelter, zoneCategory: .outer, isEssential: true, isPacked: false),
                    LogisticItem(name: "Flysheet", quantity: 1, unit: .pcs, ownership: .kelompok, functionalCategory: .shelter, zoneCategory: .outer, isEssential: true, isPacked: false),
                ]
            ),

            // MARK: - Barang Pribadi
            LogisticSectionModel(
                categoryType: .functional(.personalItem),
                items: [
                    LogisticItem(name: "Sepatu Gunung", quantity: 1, unit: .pcs, ownership: .pribadi, functionalCategory: .personalItem, zoneCategory: .outer, isEssential: true, isPacked: false),
                    LogisticItem(name: "Jaket Gunung", quantity: 1, unit: .pcs, ownership: .pribadi, functionalCategory: .personalItem, zoneCategory: .upperMiddle, isEssential: true, isPacked: false),
                    LogisticItem(name: "Jas Hujan", quantity: 1, unit: .pcs, ownership: .pribadi, functionalCategory: .personalItem, zoneCategory: .outer, isEssential: true, isPacked: false),
                    LogisticItem(name: "Sarung Tangan", quantity: 1, unit: .pcs, ownership: .pribadi, functionalCategory: .personalItem, zoneCategory: .upperMiddle, isEssential: true, isPacked: false),
                    LogisticItem(name: "KTP", quantity: 1, unit: .pcs, ownership: .pribadi, functionalCategory: .personalItem, zoneCategory: .top, isEssential: true, isPacked: false),
                    LogisticItem(name: "Surat Izin Pendakian", quantity: 1, unit: .pcs, ownership: .kelompok, functionalCategory: .personalItem, zoneCategory: .top, isEssential: true, isPacked: false),
                    LogisticItem(name: "Sandal", quantity: 1, unit: .pcs, ownership: .pribadi, functionalCategory: .personalItem, zoneCategory: .outer, isEssential: false, isPacked: false),
                    LogisticItem(name: "Sunscreen", quantity: 1, unit: .pcs, ownership: .pribadi, functionalCategory: .personalItem, zoneCategory: .top, isEssential: true, isPacked: false),
                    LogisticItem(name: "Peralatan Mandi", quantity: 1, unit: .pcs, ownership: .pribadi, functionalCategory: .personalItem, zoneCategory: .outer, isEssential: false, isPacked: false),
                    LogisticItem(name: "Kaos Kaki", quantity: 2, unit: .pcs, ownership: .pribadi, functionalCategory: .personalItem, zoneCategory: .lowerMiddle, isEssential: true, isPacked: false),
                    LogisticItem(name: "Pakaian Layering", quantity: 1, unit: .pcs, ownership: .pribadi, functionalCategory: .personalItem, zoneCategory: .lowerMiddle, isEssential: true, isPacked: false),
                    LogisticItem(name: "Baju Ganti", quantity: 2, unit: .pcs, ownership: .pribadi, functionalCategory: .personalItem, zoneCategory: .lowerMiddle, isEssential: true, isPacked: false),
                    LogisticItem(name: "Celana Ganti", quantity: 2, unit: .pcs, ownership: .pribadi, functionalCategory: .personalItem, zoneCategory: .lowerMiddle, isEssential: true, isPacked: false),
                    LogisticItem(name: "Pakaian Dalam Ganti", quantity: 3, unit: .pcs, ownership: .pribadi, functionalCategory: .personalItem, zoneCategory: .lowerMiddle, isEssential: true, isPacked: false),
                    LogisticItem(name: "Masker", quantity: 3, unit: .pcs, ownership: .pribadi, functionalCategory: .personalItem, zoneCategory: .top, isEssential: false, isPacked: false),
                    LogisticItem(name: "Topi", quantity: 1, unit: .pcs, ownership: .pribadi, functionalCategory: .personalItem, zoneCategory: .top, isEssential: false, isPacked: false),
                ]
            ),

            // MARK: - Logistik & Makanan
            LogisticSectionModel(
                categoryType: .functional(.logisticAndFood),
                items: [
                    LogisticItem(name: "Nesting (1 Set)", quantity: 1, unit: .pcs, ownership: .kelompok, functionalCategory: .logisticAndFood, zoneCategory: .bottom, isEssential: true, isPacked: false),
                    LogisticItem(name: "Korek Api", quantity: 2, unit: .pcs, ownership: .kelompok, functionalCategory: .logisticAndFood, zoneCategory: .top, isEssential: true, isPacked: false),
                    LogisticItem(name: "Botol Air", quantity: 2, unit: .pcs, ownership: .pribadi, functionalCategory: .logisticAndFood, zoneCategory: .outer, isEssential: true, isPacked: false),
                    LogisticItem(name: "Makanan Ringan", quantity: 5, unit: .pcs, ownership: .pribadi, functionalCategory: .logisticAndFood, zoneCategory: .upperMiddle, isEssential: true, isPacked: false),
                    LogisticItem(name: "Gas Kaleng", quantity: 2, unit: .pcs, ownership: .kelompok, functionalCategory: .logisticAndFood, zoneCategory: .bottom, isEssential: true, isPacked: false),
                    LogisticItem(name: "Filter Air Portable", quantity: 1, unit: .pcs, ownership: .kelompok, functionalCategory: .logisticAndFood, zoneCategory: .outer, isEssential: false, isPacked: false),
                    LogisticItem(name: "Piring", quantity: 1, unit: .pcs, ownership: .pribadi, functionalCategory: .logisticAndFood, zoneCategory: .bottom, isEssential: false, isPacked: false),
                    LogisticItem(name: "Sendok", quantity: 1, unit: .pcs, ownership: .pribadi, functionalCategory: .logisticAndFood, zoneCategory: .top, isEssential: false, isPacked: false),
                ]
            ),

            // MARK: - Safety Tools
            LogisticSectionModel(
                categoryType: .functional(.safetyTools),
                items: [
                    LogisticItem(name: "Headlamp", quantity: 1, unit: .pcs, ownership: .pribadi, functionalCategory: .safetyTools, zoneCategory: .top, isEssential: true, isPacked: false),
                    LogisticItem(name: "Tali Prusik", quantity: 1, unit: .pcs, ownership: .pribadi, functionalCategory: .safetyTools, zoneCategory: .outer, isEssential: false, isPacked: false),
                    LogisticItem(name: "Alat Jahit", quantity: 1, unit: .pcs, ownership: .kelompok, functionalCategory: .safetyTools, zoneCategory: .top, isEssential: false, isPacked: false),
                    LogisticItem(name: "Trekking Pole", quantity: 1, unit: .pcs, ownership: .pribadi, functionalCategory: .safetyTools, zoneCategory: .outer, isEssential: false, isPacked: false),
                    LogisticItem(name: "Pisau Lipat", quantity: 1, unit: .pcs, ownership: .pribadi, functionalCategory: .safetyTools, zoneCategory: .top, isEssential: true, isPacked: false),
                    LogisticItem(name: "Peta", quantity: 1, unit: .pcs, ownership: .kelompok, functionalCategory: .safetyTools, zoneCategory: .top, isEssential: true, isPacked: false),
                    LogisticItem(name: "Kompas", quantity: 1, unit: .pcs, ownership: .kelompok, functionalCategory: .safetyTools, zoneCategory: .top, isEssential: true, isPacked: false),
                ]
            ),

            // MARK: - P3K
            LogisticSectionModel(
                categoryType: .functional(.medicalKit),
                items: [
                    LogisticItem(name: "Gulungan Kasa Steril", quantity: 2, unit: .pcs, ownership: .kelompok, functionalCategory: .medicalKit, zoneCategory: .top, isEssential: true, isPacked: false),
                    LogisticItem(name: "Pembersih Berbahan Dasar Alkohol", quantity: 1, unit: .pcs, ownership: .kelompok, functionalCategory: .medicalKit, zoneCategory: .top, isEssential: true, isPacked: false),
                    LogisticItem(name: "Pinset", quantity: 1, unit: .pcs, ownership: .kelompok, functionalCategory: .medicalKit, zoneCategory: .top, isEssential: true, isPacked: false),
                    LogisticItem(name: "Salep Antiseptik", quantity: 1, unit: .pcs, ownership: .kelompok, functionalCategory: .medicalKit, zoneCategory: .top, isEssential: true, isPacked: false),
                    LogisticItem(name: "Perban Elastis", quantity: 2, unit: .pcs, ownership: .kelompok, functionalCategory: .medicalKit, zoneCategory: .top, isEssential: true, isPacked: false),
                    LogisticItem(name: "Sarung Tangan Lateks", quantity: 2, unit: .pcs, ownership: .kelompok, functionalCategory: .medicalKit, zoneCategory: .top, isEssential: true, isPacked: false),
                    LogisticItem(name: "Ibuprofen & Antihistamin", quantity: 10, unit: .pcs, ownership: .kelompok, functionalCategory: .medicalKit, zoneCategory: .top, isEssential: true, isPacked: false),
                    LogisticItem(name: "Bubuk Elektrolit", quantity: 5, unit: .pcs, ownership: .kelompok, functionalCategory: .medicalKit, zoneCategory: .top, isEssential: true, isPacked: false),
                    LogisticItem(name: "Minyak Kayu Putih", quantity: 1, unit: .pcs, ownership: .kelompok, functionalCategory: .medicalKit, zoneCategory: .top, isEssential: true, isPacked: false),
                    LogisticItem(name: "Kapas", quantity: 1, unit: .pcs, ownership: .kelompok, functionalCategory: .medicalKit, zoneCategory: .top, isEssential: true, isPacked: false),
                    LogisticItem(name: "Plester", quantity: 10, unit: .pcs, ownership: .kelompok, functionalCategory: .medicalKit, zoneCategory: .top, isEssential: true, isPacked: false),
                    LogisticItem(name: "Obat-obatan Pribadi", quantity: 1, unit: .pcs, ownership: .pribadi, functionalCategory: .medicalKit, zoneCategory: .top, isEssential: true, isPacked: false),
                ]
            )
        ]
    )
}
