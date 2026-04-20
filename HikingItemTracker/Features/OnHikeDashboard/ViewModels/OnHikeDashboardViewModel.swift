//
//  OnHikeDashboardViewModel.swift
//  HikingItemTracker
//
//  Created by Brian Anashari on 20/04/26.
//

import SwiftUI
import Observation

@Observable
final class OnHikeDashboardViewModel {
    var mountain: Mountain
    var hikingTrip: HikingTripModel

    var isStatusSheetPresented: Bool = false
    var isFinishAlertPresented: Bool = false
    var selectedPhase: HikePhase = .istirahat

    var progressPercentage: CGFloat {
        hikingTrip.progressPercentage
    }

    var progressText: String {
        "\(Int(progressPercentage * 100))%"
    }

    var durationText: String {
        "\(mountain.duration) Hari Perjalanan"
    }

    var altitudeText: String {
        "3.726 mdpl"
    }

    var filteredItems: [LogisticItem] {
        hikingTrip.sections.flatMap(\.items)
    }

    init(
        mountain: Mountain = Mountain.mocks.first!,
        hikingTrip: HikingTripModel = .mock
    ) {
        self.mountain = mountain
        self.hikingTrip = hikingTrip
    }

    func toggleItemPacked(_ item: LogisticItem) {
        for sectionIndex in hikingTrip.sections.indices {
            if let itemIndex = hikingTrip.sections[sectionIndex].items.firstIndex(where: { $0.id == item.id }) {
                hikingTrip.sections[sectionIndex].items[itemIndex].isPacked.toggle()
                return
            }
        }
    }
}
