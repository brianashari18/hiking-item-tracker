//
//  ItemZoneCategory.swift
//  HikingItemTracker
//
//  Created by Brian Anashari on 20/04/26.
//

import Foundation

enum ItemZoneCategory: String, CaseIterable, Identifiable {
    case bottom = "Zona Bawah"
    case lowerMiddle = "Zona Tengah Bawah"
    case upperMiddle = "Zona Tengah Atas"
    case top = "Zona Atas"
    case outer = "Zona Luar"

    var id: String { rawValue }

    var iconName: String {
        switch self {
        case .bottom: return "arrow.down.to.line"
        case .lowerMiddle: return "arrow.down"
        case .upperMiddle: return "arrow.up"
        case .top: return "arrow.up.to.line"
        case .outer: return "square.on.square"
        }
    }
}
