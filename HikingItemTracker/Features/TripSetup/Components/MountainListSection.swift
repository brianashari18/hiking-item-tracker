//
//  MountainListSection.swift
//  HikingItemTracker
//
//  Created by Brian Anashari on 16/04/26.
//

import SwiftUI

struct MountainListSection: View {
    let grade: String
    let mountains: [Mountain]
    let selectedMountain: Mountain
    let onSelect: (Mountain) -> Void

    var body: some View {
        Section("Grade \(grade)") {
            ForEach(mountains.filter { $0.grade.rawValue == grade }) { mountain in
                MountainListRow(
                    mountain: mountain,
                    isSelected: mountain.id == selectedMountain.id,
                    onTap: { onSelect(mountain) }
                )
            }
        }
    }
}
