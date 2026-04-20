//
//  ItemFunctionalCategory.swift
//  HikingItemTracker
//
//  Created by Brian Anashari on 20/04/26.
//

import Foundation

enum ItemFunctionalCategory: String, CaseIterable, Identifiable {
    case additionalEquipment    = "Perlengkapan Tambahan"
    case healthAndSanitation    = "Kesehatan dan Sanitasi"
    case logisticsAndConsumption = "Perlengkapan Logistik dan Konsumsi"
    case cookingEquipment       = "Perlengkapan Memasak"
    case clothingEquipment      = "Perlengkapan Pakaian"
    case sleepingEquipment      = "Perlengkapan Tidur"
    case tentEquipment          = "Perlengkapan Tenda"

    var id: String { rawValue }

    var iconName: String {
        switch self {
        case .additionalEquipment:    return "backpack"
        case .healthAndSanitation:   return "cross.case"
        case .logisticsAndConsumption: return "cart"
        case .cookingEquipment:      return "flame"
        case .clothingEquipment:     return "tshirt"
        case .sleepingEquipment:     return "moon.zzz"
        case .tentEquipment:         return "house"
        }
    }

    var defaultZone: ItemZoneCategory {
        switch self {
        case .additionalEquipment, .healthAndSanitation:
            return .top
        case .logisticsAndConsumption, .cookingEquipment:
            return .upperMiddle
        case .clothingEquipment, .sleepingEquipment:
            return .lowerMiddle
        case .tentEquipment:
            return .bottom
        }
    }
}
