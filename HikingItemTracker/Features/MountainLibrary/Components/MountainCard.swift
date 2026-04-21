//
//  MountainCard.swift
//  HikingItemTracker
//
//  Created by Brian Anashari on 20/04/26.
//

import SwiftUI

struct MountainCard: View {
    let mountain: Mountain

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            // MARK: Thumbnail
            thumbnailSection

            // MARK: Info
            VStack(alignment: .leading, spacing: 6) {
                // Name
                Text(mountain.name)
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .lineLimit(1)
                    .foregroundStyle(.primary)

                // Location
                Label(mountain.location, systemImage: "mappin.circle.fill")
                    .font(.caption)
                    .foregroundStyle(.secondary)
                    .lineLimit(1)

                // Stats row
                HStack(spacing: 8) {
                    Label(mountain.altitudeFormatted, systemImage: "arrow.up.circle.fill")
                        .font(.caption2)
                        .foregroundStyle(.secondary)
                    Spacer()
                    Label(mountain.durationBadge, systemImage: "clock.fill")
                        .font(.caption2)
                        .foregroundStyle(.secondary)
                }

                // Badges
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 4) {
                        ForEach(mountain.badges.prefix(3), id: \.self) { badge in
                            MountainBadgeChip(text: badge)
                        }
                    }
                }
                .allowsHitTesting(false)
            }
            .padding(10)
            .padding(.bottom, 4)
        }
        .background(.background)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .shadow(color: .black.opacity(0.09), radius: 10, x: 0, y: 4)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .strokeBorder(Color.primary.opacity(0.05), lineWidth: 1)
        )
    }

    // MARK: - Thumbnail Section

    private var thumbnailSection: some View {
        ZStack {
            gradeGradient
                .frame(height: 100)

            Image(systemName: mountain.thumbnailSystemIcon)
                .font(.system(size: 38, weight: .semibold))
                .foregroundStyle(.white.opacity(0.85))
                .shadow(color: .black.opacity(0.2), radius: 4, y: 2)

            // Grade badge
            VStack {
                HStack {
                    Spacer()
                    Text("Grade \(mountain.grade)")
                        .font(.system(size: 10, weight: .bold))
                        .foregroundStyle(.white)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 3)
                        .background(.white.opacity(0.25))
                        .clipShape(Capsule())
                }
                Spacer()
            }
            .padding(8)

            // Popular star
            if mountain.isPopular {
                VStack {
                    HStack {
                        Image(systemName: "star.fill")
                            .font(.caption2)
                            .foregroundStyle(.yellow)
                            .padding(5)
                            .background(.black.opacity(0.25))
                            .clipShape(Circle())
                        Spacer()
                    }
                    Spacer()
                }
                .padding(8)
            }
        }
        .clipShape(
            .rect(
                topLeadingRadius: 16,
                bottomLeadingRadius: 0,
                bottomTrailingRadius: 0,
                topTrailingRadius: 16
            )
        )
    }

    // MARK: - Grade Gradient

    private var gradeGradient: LinearGradient {
        switch mountain.grade {
        case "I":
            return LinearGradient(
                colors: [Color(hue: 0.42, saturation: 0.6, brightness: 0.75),
                         Color(hue: 0.48, saturation: 0.55, brightness: 0.65)],
                startPoint: .topLeading, endPoint: .bottomTrailing
            )
        case "II":
            return LinearGradient(
                colors: [Color(hue: 0.55, saturation: 0.65, brightness: 0.75),
                         Color(hue: 0.60, saturation: 0.70, brightness: 0.60)],
                startPoint: .topLeading, endPoint: .bottomTrailing
            )
        case "III":
            return LinearGradient(
                colors: [Color(hue: 0.10, saturation: 0.70, brightness: 0.85),
                         Color(hue: 0.06, saturation: 0.75, brightness: 0.70)],
                startPoint: .topLeading, endPoint: .bottomTrailing
            )
        case "IV":
            return LinearGradient(
                colors: [Color(hue: 0.03, saturation: 0.80, brightness: 0.80),
                         Color(hue: 0.00, saturation: 0.85, brightness: 0.60)],
                startPoint: .topLeading, endPoint: .bottomTrailing
            )
        default: // Grade V
            return LinearGradient(
                colors: [Color(hue: 0.78, saturation: 0.60, brightness: 0.55),
                         Color(hue: 0.75, saturation: 0.70, brightness: 0.35)],
                startPoint: .topLeading, endPoint: .bottomTrailing
            )
        }
    }
}

#Preview {
    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
        MountainCard(mountain: Mountain.mocks[0])
        MountainCard(mountain: Mountain.mocks[6])
        MountainCard(mountain: Mountain.mocks[18])
        MountainCard(mountain: Mountain.mocks[22])
    }
    .padding()
}
