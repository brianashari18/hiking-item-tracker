//
//  MountainDetailStatsSection.swift
//  HikingItemTracker
//
//  Created by Brian Anashari on 23/04/26.
//
import SwiftUI

struct MountainDetailStatsSection: View {
    let mountain: Mountain
    let gradeAccentColor: Color

    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        LazyVGrid(columns: columns, spacing: 12) {
            StatCell(
                icon: "arrow.up.circle.fill",
                label: "Ketinggian",
                value: "\(mountain.height) mdpl",
                tintColor: gradeAccentColor
            )
            StatCell(
                icon: "clock.fill",
                label: "Estimasi Durasi",
                value: "\(mountain.duration) Hari",
                tintColor: gradeAccentColor
            )
            StatCell(
                icon: "chart.bar.fill",
                label: "Tingkat Kesulitan",
                value: mountain.difficulty,
                tintColor: gradeAccentColor
            )
            StatCell(
                icon: "exclamationmark.triangle.fill",
                label: "Status Gunung",
                value: mountain.status,
                tintColor: gradeAccentColor
            )
        }
    }
}

struct StatCell: View {
    let icon: String
    let label: String
    let value: String
    let tintColor: Color

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .font(.title3)
                .foregroundStyle(tintColor)
                .frame(width: 32)

            VStack(alignment: .leading, spacing: 2) {
                Text(label)
                    .font(.caption)
                    .foregroundStyle(.secondary)
                Text(value)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.primary)
                    .lineLimit(1)
            }
        }
        .padding(12)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(.systemGray6))
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}
