//
//  ItemFunctionalCategory.swift
//  HikingItemTracker
//
//  Created by Brian Anashari on 20/04/26.
//

import Foundation

enum ItemFunctionalCategory: String, CaseIterable, Identifiable, Codable {
    case shelter            = "Shelter"
    case personalItem       = "Barang Pribadi"
    case logisticAndFood    = "Logistik & Makanan"
    case safetyTools        = "Safety Tools"
    case medicalKit         = "P3K"
    case specialGear        = "Perlengkapan Khusus"

    var id: String { rawValue }

    var iconName: String {
        switch self {
        case .shelter:           return "tent"
        case .personalItem:      return "person.fill"
        case .logisticAndFood:   return "fork.knife"
        case .safetyTools:       return "gearshape.fill"
        case .medicalKit:        return "cross.case"
        case .specialGear:       return "star.fill"
        }
    }

    var defaultZone: ItemZoneCategory {
        switch self {
        case .shelter:
            return .bottom
        case .personalItem:
            return .lowerMiddle
        case .logisticAndFood:
            return .upperMiddle
        case .safetyTools, .medicalKit:
            return .top
        case .specialGear:
            return .top
        }
    }
}

