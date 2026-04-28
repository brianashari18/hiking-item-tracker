//
//  MountainTypeTag.swift
//  HikingItemTracker
//
//  Created by Brian Anashari on 28/04/26.
//

import SwiftUI

// MARK: - Mountain Type Tag Chip

struct MountainTypeTag: View {
    let type: MountainType

    private var tagColor: Color {
        switch type {
        case .volcanic, .poisonous:       return .red
        case .cold, .foggy, .slippery:    return .blue
        case .forest, .mossy, .rooted:    return .green
        case .rocky, .steep, .climbing:   return .orange
        case .sandy, .dry:                return .yellow
        case .muddy, .humid:              return .brown
        }
    }

    var body: some View {
        HStack(spacing: 5) {
            Image(systemName: type.iconName)
                .font(.caption2)
            Text(type.displayName)
                .font(.caption)
                .fontWeight(.medium)
        }
        .foregroundStyle(tagColor)
        .padding(.horizontal, 10)
        .padding(.vertical, 5)
        .background(tagColor.opacity(0.12))
        .clipShape(Capsule())
        .overlay(
            Capsule()
                .strokeBorder(tagColor.opacity(0.3), lineWidth: 1)
        )
    }
}

// MARK: - Flow Layout (wrap tags ke baris baru)

struct FlowLayout: Layout {
    var spacing: CGFloat = 8

    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        let maxWidth = proposal.width ?? .infinity
        var currentX: CGFloat = 0
        var currentY: CGFloat = 0
        var rowHeight: CGFloat = 0
        var totalHeight: CGFloat = 0

        for subview in subviews {
            let size = subview.sizeThatFits(.unspecified)
            if currentX + size.width > maxWidth, currentX > 0 {
                currentY += rowHeight + spacing
                totalHeight = currentY
                currentX = 0
                rowHeight = 0
            }
            currentX += size.width + spacing
            rowHeight = max(rowHeight, size.height)
        }
        totalHeight += rowHeight
        return CGSize(width: maxWidth, height: totalHeight)
    }

    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        let maxWidth = bounds.width
        var currentX: CGFloat = bounds.minX
        var currentY: CGFloat = bounds.minY
        var rowHeight: CGFloat = 0

        for subview in subviews {
            let size = subview.sizeThatFits(.unspecified)
            if currentX + size.width > bounds.maxX, currentX > bounds.minX {
                currentY += rowHeight + spacing
                currentX = bounds.minX
                rowHeight = 0
            }
            subview.place(at: CGPoint(x: currentX, y: currentY), proposal: ProposedViewSize(size))
            currentX += size.width + spacing
            rowHeight = max(rowHeight, size.height)
            _ = maxWidth
        }
    }
}

#Preview {
    VStack(alignment: .leading, spacing: 12) {
        FlowLayout(spacing: 8) {
            ForEach(MountainType.allCases, id: \.self) { type in
                MountainTypeTag(type: type)
            }
        }
    }
    .padding()
}
