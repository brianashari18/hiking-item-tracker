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
    @Environment(AppSession.self) private var session

    @State private var showLockedAlert = false

    /// User sedang dalam pendakian aktif (sudah checklist semua & masuk OnHikeDashboard)
    private var isActivelyHiking: Bool {
        guard let trip = session.activeTrip else { return false }
        return trip.progressPercentage >= 1.0
    }
    
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
                        
                        VStack(alignment: .leading, spacing: 10) {
                            Label("Tag Gunung", systemImage: "tag.fill")
                                .font(.headline)
                                .foregroundStyle(.primary)

                            FlowLayout(spacing: 8) {
                                ForEach(mountain.type, id: \.self) { type in
                                    MountainTypeTag(type: type)
                                }
                            }
                        }
                        
                        Divider()
                        
                        Spacer()
                        
                        MountainDetailCTAButton(
                            gradeGradient: mountain.grade.gradient,
                            gradeAccentColor: mountain.grade.accentColor,
                            selectedMountain: mountain
                        ) {
                            if isActivelyHiking {
                                showLockedAlert = true
                            } else {
                                dismiss()
                                router.showTripSetup(mountain: mountain)
                            }
                        }
                        .alert("Pendakian Sedang Berlangsung", isPresented: $showLockedAlert) {
                            Button("Mengerti", role: .cancel) {}
                        } message: {
                            Text("Selesaikan pendakianmu terlebih dahulu sebelum memilih gunung baru.")
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
        let typeList = mountain.type.map { $0.displayName.lowercased() }.joined(separator: ", ")
        return "\(mountain.name) berada di \(mountain.location) dengan ketinggian \(mountain.height) mdpl. Jalur pendakiannya \(mountain.grade.difficulty.lowercased()) dan umumnya ditempuh sekitar \(mountain.duration) hari. Gunung ini memiliki karakteristik \(typeList)."
    }
}

#Preview {
    MountainDetailSheet(mountain: Mountain.mocks[0])
        .environment(AppRouter())
        .environment(AppSession())
}
