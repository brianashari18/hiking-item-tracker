//
//  MountainDetailSheet.swift
//  HikingItemTracker
//
//  Created by Brian Anashari on 23/04/26.
//

import SwiftUI

struct MountainDetailSheet: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    heroHeader

                    // MARK: Content
                    VStack(alignment: .leading, spacing: 24) {
                        // Short description
                        Text("Gunung Rinjani merupakan gunung yang terletak di Lombok, Nusa Tenggara Barat Indonesia. Gunung ini memiliki tinggi 3.725 mdpl dan merupakan salah satu gunung tertinggi di Indonesia.")
                            .font(.body)
                            .foregroundStyle(.secondary)
                            .fixedSize(horizontal: false, vertical: true)

                        Divider()

                        // Stats grid
                        statsGrid

                        Divider()

                        // Trail characteristics
                        trailSection
                        
                        Divider()
                        
                        Spacer()
                        
                        ctaButton

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

    // MARK: - Hero Header

    private var heroHeader: some View {
        ZStack(alignment: .bottomLeading) {
            // Gradient background
            Image("img_mountain")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity, maxHeight: 450)

            // Text overlay
            VStack(alignment: .leading, spacing: 6) {
                // Grade pill
                HStack(spacing: 6) {
                    Text("Grade IV")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 4)
                        .background(.white.opacity(0.25))
                        .clipShape(Capsule())

                    Text("Sulit")
                        .font(.caption)
                        .foregroundStyle(.white.opacity(0.85))
                }

                Text("Gunung Rinjani")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)

                Label("Nusa Tenggara Barat", systemImage: "mappin.and.ellipse")
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
                value: "3.726 mdpl",
                tintColor: gradeAccentColor
            )
            StatCell(
                icon: "clock.fill",
                label: "Estimasi Durasi",
                value: "4 Hari",
                tintColor: gradeAccentColor
            )
            StatCell(
                icon: "chart.bar.fill",
                label: "Tingkat Kesulitan",
                value: "Sulit",
                tintColor: gradeAccentColor
            )
            StatCell(
                icon: "person.2.fill",
                label: "Bingung",
                value: "Isinya Apaan",
                tintColor: gradeAccentColor
            )
        }
    }

    private var trailSection: some View {
        VStack(alignment: .leading, spacing: 10) {
            Label("Karakteristik Jalur", systemImage: "signpost.right.and.left.fill")
                .font(.headline)
                .foregroundStyle(.primary)

            Text("Penjelasan terkait kondisi jalur dan medan trekking seperti apa nantinya")
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .fixedSize(horizontal: false, vertical: true)
        }
    }

    // MARK: - CTA Button

    private var ctaButton: some View {
        Button {
            
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
        return LinearGradient(colors: [Color(hue:0.42,saturation:0.6,brightness:0.75),Color(hue:0.48,saturation:0.55,brightness:0.65)], startPoint:.topLeading, endPoint:.bottomTrailing)
    }

    private var gradeAccentColor: Color {
        switch "I" {
        case "I":   return Color(hue:0.42,saturation:0.6,brightness:0.75)
        case "II":  return Color(hue:0.55,saturation:0.65,brightness:0.75)
        case "III": return Color(hue:0.10,saturation:0.70,brightness:0.85)
        case "IV":  return Color(hue:0.03,saturation:0.80,brightness:0.80)
        default:    return Color(hue:0.78,saturation:0.60,brightness:0.55)
        }
    }
}

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
    MountainDetailSheet()
}
