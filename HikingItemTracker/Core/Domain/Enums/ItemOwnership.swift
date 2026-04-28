//
//  ItemOwnership.swift
//  HikingItemTracker
//
//  Created by Brian Anashari on 19/04/26.
//

import Foundation

enum ItemOwnership: String, CaseIterable, Identifiable, Codable {
    case pribadi = "Pribadi"
    case kelompok = "Kelompok"
    case sewaan = "Sewaan"

    var id: String { rawValue }
}
