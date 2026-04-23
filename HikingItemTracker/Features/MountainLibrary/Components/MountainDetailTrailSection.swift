//
//  MountainDetailTrailSection.swift
//  HikingItemTracker
//
//  Created by Brian Anashari on 23/04/26.
//
import SwiftUI

struct MountainDetailTrailSection: View {
    let mountain: Mountain

    var body: some View {
        VStack(alignment: .leading, spacing: 18) {
            DetailInfoBlock(
                title: "Karakteristik Jalur",
                systemImage: "signpost.right.and.left.fill",
                description: mountain.terrain
            )
            
            Divider()

            DetailInfoBlock(
                title: "Fauna yang Perlu Diperhatikan",
                systemImage: "pawprint.fill",
                description: mountain.fauna
            )
        }
    }
}
