//
//  MountainDetailSheet.swift
//  HikingItemTracker
//
//  Created by Brian Anashari on 20/04/26.
//

import SwiftUI

struct MountainDetailSheet: View {
    let mountain: Mountain
    let onSelect: (Mountain) -> Void

    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    // MARK: Hero Header
                    heroHeader

                    // MARK: Content
                    VStack(alignment: .leading, spacing: 24) {
                        // Short description
                        Text(mountain.shortDescription)
                            .font(.body)
                            .foregroundStyle(.secondary)
                            .fixedSize(horizontal: false, vertical: true)

                        Divider()

                        // Stats grid
                        statsGrid

                        Divider()

                        // Trail characteristics
                        trailSection

                        // Badges
                        badgesSection
                    }
                    .padding(20)
                }
            }
            .ignoresSafeArea(edges: .top)
            .safeAreaInset(edge: .bottom) {
                ctaButton
                    .padding(.horizontal, 20)
                    .padding(.vertical, 12)
                    .background(.ultraThinMaterial)
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .font(.title3)
                            .foregroundStyle(.white.opacity(0.85))
                            .shadow(radius: 4)
                    }
                }
            }
            .toolbarBackground(.hidden, for: .navigationBar)
        }
    }

    // MARK: - Hero Header

    private var heroHeader: some View {
        ZStack(alignment: .bottomLeading) {
            // Gradient background
            gradeGradient
                .frame(height: 220)

            // Decorative circles
            Circle()
                .fill(.white.opacity(0.06))
                .frame(width: 180)
                .offset(x: 180, y: -40)

            Circle()
                .fill(.white.opacity(0.06))
                .frame(width: 120)
                .offset(x: 240, y: 40)

            // Big icon
            Image(systemName: mountain.thumbnailSystemIcon)
                .font(.system(size: 80, weight: .semibold))
                .foregroundStyle(.white.opacity(0.15))
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.trailing, 20)

            // Text overlay
            VStack(alignment: .leading, spacing: 6) {
                // Grade pill
                HStack(spacing: 6) {
                    Text("Grade \(mountain.grade)")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 4)
                        .background(.white.opacity(0.25))
                        .clipShape(Capsule())

                    Text(mountain.difficulty)
                        .font(.caption)
                        .foregroundStyle(.white.opacity(0.85))
                }

                Text(mountain.name)
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)

                Label(mountain.location, systemImage: "mappin.and.ellipse")
                    .font(.subheadline)
                    .foregroundStyle(.white.opacity(0.85))
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 24)
        }
    }

    // MARK: - Stats Grid

    private var statsGrid: some View {
        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
            StatCell(
                icon: "arrow.up.circle.fill",
                label: "Ketinggian",
                value: mountain.altitudeFormatted,
                tintColor: gradeAccentColor
            )
            StatCell(
                icon: "clock.fill",
                label: "Estimasi Durasi",
                value: "\(mountain.estimatedDurationDays) hari",
                tintColor: gradeAccentColor
            )
            StatCell(
                icon: "chart.bar.fill",
                label: "Tingkat Kesulitan",
                value: mountain.difficulty,
                tintColor: gradeAccentColor
            )
            StatCell(
                icon: "person.2.fill",
                label: "Kategori",
                value: mountain.estimatedDurationDays == 1 ? "Day Hike" : "Overnight",
                tintColor: gradeAccentColor
            )
        }
    }

    // MARK: - Trail Section

    private var trailSection: some View {
        VStack(alignment: .leading, spacing: 10) {
            Label("Karakteristik Jalur", systemImage: "signpost.right.and.left.fill")
                .font(.headline)
                .foregroundStyle(.primary)

            Text(mountain.trailCharacteristics)
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .fixedSize(horizontal: false, vertical: true)
        }
    }

    // MARK: - Badges Section

    private var badgesSection: some View {
        VStack(alignment: .leading, spacing: 10) {
            Label("Kategori & Info", systemImage: "tag.fill")
                .font(.headline)
                .foregroundStyle(.primary)

            FlowLayout(spacing: 6) {
                ForEach(mountain.badges, id: \.self) { badge in
                    MountainBadgeChip(text: badge)
                }
            }
        }
    }

    // MARK: - CTA Button

    private var ctaButton: some View {
        Button {
            dismiss()
            onSelect(mountain)
        } label: {
            HStack(spacing: 10) {
                Image(systemName: "checkmark.circle.fill")
                    .font(.headline)
                Text("Pilih Gunung Ini")
                    .font(.headline)
                    .fontWeight(.semibold)
            }
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity)
            .frame(height: 52)
            .background(gradeGradient)
            .clipShape(RoundedRectangle(cornerRadius: 26))
            .shadow(color: gradeAccentColor.opacity(0.4), radius: 12, y: 4)
        }
        .buttonStyle(.plain)
    }

    // MARK: - Helpers

    private var gradeGradient: LinearGradient {
        switch mountain.grade {
        case "I":
            return LinearGradient(colors: [Color(hue:0.42,saturation:0.6,brightness:0.75),Color(hue:0.48,saturation:0.55,brightness:0.65)], startPoint:.topLeading, endPoint:.bottomTrailing)
        case "II":
            return LinearGradient(colors: [Color(hue:0.55,saturation:0.65,brightness:0.75),Color(hue:0.60,saturation:0.70,brightness:0.60)], startPoint:.topLeading, endPoint:.bottomTrailing)
        case "III":
            return LinearGradient(colors: [Color(hue:0.10,saturation:0.70,brightness:0.85),Color(hue:0.06,saturation:0.75,brightness:0.70)], startPoint:.topLeading, endPoint:.bottomTrailing)
        case "IV":
            return LinearGradient(colors: [Color(hue:0.03,saturation:0.80,brightness:0.80),Color(hue:0.00,saturation:0.85,brightness:0.60)], startPoint:.topLeading, endPoint:.bottomTrailing)
        default:
            return LinearGradient(colors: [Color(hue:0.78,saturation:0.60,brightness:0.55),Color(hue:0.75,saturation:0.70,brightness:0.35)], startPoint:.topLeading, endPoint:.bottomTrailing)
        }
    }

    private var gradeAccentColor: Color {
        switch mountain.grade {
        case "I":   return Color(hue:0.42,saturation:0.6,brightness:0.75)
        case "II":  return Color(hue:0.55,saturation:0.65,brightness:0.75)
        case "III": return Color(hue:0.10,saturation:0.70,brightness:0.85)
        case "IV":  return Color(hue:0.03,saturation:0.80,brightness:0.80)
        default:    return Color(hue:0.78,saturation:0.60,brightness:0.55)
        }
    }
}

// MARK: - Supporting Views

private struct StatCell: View {
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

/// Layout sederhana untuk wrapping badge chips
private struct FlowLayout: Layout {
    var spacing: CGFloat = 8

    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        let sizes = subviews.map { $0.sizeThatFits(.unspecified) }
        return layout(sizes: sizes, proposal: proposal).size
    }

    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        let sizes = subviews.map { $0.sizeThatFits(.unspecified) }
        let offsets = layout(sizes: sizes, proposal: proposal).offsets
        for (subview, offset) in zip(subviews, offsets) {
            subview.place(at: CGPoint(x: bounds.minX + offset.x, y: bounds.minY + offset.y), proposal: .unspecified)
        }
    }

    private func layout(sizes: [CGSize], proposal: ProposedViewSize) -> (offsets: [CGPoint], size: CGSize) {
        let maxWidth = proposal.width ?? .infinity
        var offsets: [CGPoint] = []
        var x: CGFloat = 0
        var y: CGFloat = 0
        var rowHeight: CGFloat = 0
        var totalWidth: CGFloat = 0

        for size in sizes {
            if x + size.width > maxWidth, x > 0 {
                y += rowHeight + spacing
                x = 0
                rowHeight = 0
            }
            offsets.append(CGPoint(x: x, y: y))
            x += size.width + spacing
            rowHeight = max(rowHeight, size.height)
            totalWidth = max(totalWidth, x - spacing)
        }
        return (offsets, CGSize(width: totalWidth, height: y + rowHeight))
    }
}

#Preview {
    MountainDetailSheet(mountain: Mountain.mocks[18]) { _ in }
}
