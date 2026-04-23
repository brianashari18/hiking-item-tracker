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
                    MountainDetailHeroSection(mountain: mountain, gradeAccentColor: gradeAccentColor)

                    VStack(alignment: .leading, spacing: 24) {
                        Text(descriptionText)
                            .font(.body)
                            .foregroundStyle(.secondary)
                            .fixedSize(horizontal: false, vertical: true)

                        Divider()

                        MountainDetailStatsSection(
                            mountain: mountain,
                            gradeAccentColor: gradeAccentColor
                        )

                        Divider()

                        MountainDetailTrailSection(mountain: mountain)
                        
                        Divider()
                        
                        Spacer()
                        
                        MountainDetailCTAButton(
                            gradeGradient: gradeGradient,
                            gradeAccentColor: gradeAccentColor,
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
        "\(mountain.name) berada di \(mountain.location) dengan ketinggian \(mountain.height) mdpl. Jalur pendakiannya \(mountain.difficulty.lowercased()) dan umumnya ditempuh sekitar \(mountain.duration) hari."
    }

    private var gradeGradient: LinearGradient {
        LinearGradient(
            colors: [
                gradeAccentColor.opacity(0.95),
                gradeAccentColor.opacity(0.75)
            ],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }

    private var gradeAccentColor: Color {
        switch mountain.grade {
        case "I":
            return Color(hue: 0.42, saturation: 0.6, brightness: 0.75)
        case "II":
            return Color(hue: 0.55, saturation: 0.65, brightness: 0.75)
        case "III":
            return Color(hue: 0.10, saturation: 0.70, brightness: 0.85)
        case "IV":
            return Color(hue: 0.03, saturation: 0.80, brightness: 0.80)
        default:
            return Color(hue: 0.78, saturation: 0.60, brightness: 0.55)
        }
    }
}

#Preview {
    MountainDetailSheet(mountain: Mountain.mocks[0])
        .environment(AppRouter())
}
