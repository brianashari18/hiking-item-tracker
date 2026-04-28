//
//  MountainDetailSheet.swift
//  HikingItemTracker
//
//  Created by Brian Anashari on 23/04/26.
//

import SwiftUI

struct MountainDetailSheet: View {
    let mountain: Mountain

    @Environment(\.dismiss) var dismiss
    @Environment(AppRouter.self) private var router
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    MountainDetailHeroSection(mountain: mountain, gradeAccentColor: mountain.grade.accentColor)

                    VStack(alignment: .leading, spacing: 24) {
                        Text(descriptionText)
                            .font(.body)
                            .foregroundStyle(.secondary)
                            .fixedSize(horizontal: false, vertical: true)

                        Divider()

                        MountainDetailStatsSection(
                            mountain: mountain,
                            gradeAccentColor: mountain.grade.accentColor
                        )

                        Divider()

                        MountainDetailTrailSection(mountain: mountain)
                        
                        Divider()
                        
                        Spacer()
                        
                        MountainDetailCTAButton(
                            gradeGradient: mountain.grade.gradient,
                            gradeAccentColor: mountain.grade.accentColor,
                            selectedMountain: mountain
                        ) {
                            dismiss()
                            router.showTripSetup(mountain: mountain)
                        }

                    }
                    .padding(20)
                }
            }
            .ignoresSafeArea(edges: .top)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                            .font(.title3)
                            .shadow(radius: 4)
                    }
                }
            }
        }
    }

    private var descriptionText: String {
        "\(mountain.name) berada di \(mountain.location) dengan ketinggian \(mountain.height) mdpl. Jalur pendakiannya \(mountain.grade.difficulty.lowercased()) dan umumnya ditempuh sekitar \(mountain.duration) hari."
    }
}

#Preview {
    MountainDetailSheet(mountain: Mountain.mocks[0])
        .environment(AppRouter())
}
