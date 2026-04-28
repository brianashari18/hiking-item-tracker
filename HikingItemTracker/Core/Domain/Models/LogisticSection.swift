//
//  LogisticSection.swift
//  HikingItemTracker
//
//  Created by Brian Anashari on 19/04/26.
//

import Foundation

// SectionCategoryType dipindah ke Core/Domain/Enums/SectionCategoryType.swift

struct LogisticSectionModel: Identifiable, Equatable, Codable {
    var id: UUID
    let categoryType: SectionCategoryType
    var items: [GearItem]

    init(id: UUID = UUID(), categoryType: SectionCategoryType, items: [GearItem]) {
        self.id = id
        self.categoryType = categoryType
        self.items = items
    }

    var title: String { categoryType.title }

    var itemCount: Int {
        items.filter(\.isPacked).count
    }

    var totalCount: Int {
        items.count
    }
}
