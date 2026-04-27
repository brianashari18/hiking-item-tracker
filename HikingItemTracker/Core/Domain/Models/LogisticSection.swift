//
//  LogisticSectionModel.swift
//  HikingItemTracker
//
//  Created by Brian Anashari on 19/04/26.
//

import Foundation

enum SectionCategoryType: Equatable {
    case functional(ItemFunctionalCategory)
    case zone(ItemZoneCategory)

    var title: String {
        switch self {
        case .functional(let cat): return cat.rawValue
        case .zone(let zone): return zone.rawValue
        }
    }
}

struct LogisticSectionModel: Identifiable, Equatable {
    let id = UUID()
    let categoryType: SectionCategoryType
    var items: [GearItem]

    var title: String { categoryType.title }

    var itemCount: Int {
        items.filter(\.isPacked).count
    }

    var totalCount: Int {
        items.count
    }
}
