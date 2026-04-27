//
//  MountainInfoCard.swift
//  HikingItemTracker
//
//  Created by Brian Anashari on 20/04/26.
//

import SwiftUI

struct MountainInfoCard: View {
    let mountain: Mountain
    let altitudeText: String
    let durationText: String

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            // Header row
            HStack(alignment: .center, spacing: 8) {
                Text(mountain.name)
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundStyle(.primary)

                Text(altitudeText)
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 4)
                    .background(Color.green)
                    .clipShape(Capsule())

                Spacer()
            }
            .padding(.bottom, 12)

            Divider()
                .padding(.bottom, 12)

            // Detail row
            HStack(alignment: .top, spacing: 0) {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Grade \(mountain.grade.rawValue) • \(mountain.grade.difficulty)")
                        .font(.subheadline)
                        .foregroundStyle(.primary)

                    HStack(spacing: 4) {
                        Image(systemName: "mappin.and.ellipse")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                        Text(mountain.location)
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                }

                Spacer()

                Divider()
                    .frame(height: 40)
                    .padding(.horizontal, 12)

                Text(durationText)
                    .font(.subheadline)
                    .foregroundStyle(.primary)
                    .frame(minWidth: 80, alignment: .center)
            }
        }
        .padding(16)
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

#Preview {
    MountainInfoCard(
        mountain: Mountain.mocks.first!,
        altitudeText: "3.726 mdpl",
        durationText: "1 Hari Perjalanan"
    )
    .padding()
    .background(Color(.systemGroupedBackground))
}
