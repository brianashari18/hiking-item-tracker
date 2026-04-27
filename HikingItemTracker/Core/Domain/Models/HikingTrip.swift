//
//  HikingTripModel.swift
//  HikingItemTracker
//
//  Created by Brian Anashari on 19/04/26.
//

import Foundation

struct HikingTripModel: Equatable {
    let mountainName: String
    let tripDate: String
    let duration: Int
    let numberOfPeople: Int
    var sections: [LogisticSectionModel]

    var progressPercentage: CGFloat {
        let items = sections.flatMap(\.items)
        guard !items.isEmpty else { return 0 }
        let packedItems = items.filter(\.isPacked).count
        return CGFloat(packedItems) / CGFloat(items.count)
    }
}
