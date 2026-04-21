//
//  MountainBadgeChip.swift
//  HikingItemTracker
//
//  Created by Brian Anashari on 20/04/26.
//

import SwiftUI

struct MountainBadgeChip: View {
    let text: String
    var style: BadgeStyle = .auto

    enum BadgeStyle {
        case auto       // warna dipilih otomatis berdasarkan konten
        case green
        case orange
        case blue
        case purple
        case red
        case gray

        var foreground: Color {
            switch self {
            case .auto:    return .white
            case .green:   return Color(hue: 0.39, saturation: 0.8, brightness: 0.45)
            case .orange:  return Color(hue: 0.08, saturation: 0.8, brightness: 0.55)
            case .blue:    return Color(hue: 0.6, saturation: 0.7, brightness: 0.55)
            case .purple:  return Color(hue: 0.78, saturation: 0.6, brightness: 0.5)
            case .red:     return Color(hue: 0.02, saturation: 0.7, brightness: 0.5)
            case .gray:    return .secondary
            }
        }

        var background: Color {
            switch self {
            case .auto:    return .clear
            case .green:   return Color(hue: 0.39, saturation: 0.5, brightness: 0.95)
            case .orange:  return Color(hue: 0.08, saturation: 0.4, brightness: 0.98)
            case .blue:    return Color(hue: 0.6, saturation: 0.3, brightness: 0.97)
            case .purple:  return Color(hue: 0.78, saturation: 0.3, brightness: 0.97)
            case .red:     return Color(hue: 0.02, saturation: 0.3, brightness: 0.98)
            case .gray:    return Color(.systemGray6)
            }
        }
    }

    private var resolvedStyle: BadgeStyle {
        guard style == .auto else { return style }
        let lower = text.lowercased()
        if lower.contains("pemula") || lower.contains("santai") { return .green }
        if lower.contains("populer") || lower.contains("star")   { return .orange }
        if lower.contains("ekspedisi") || lower.contains("sulit") { return .red }
        if lower.contains("summit") || lower.contains("atap")    { return .purple }
        if lower.contains("sabana") || lower.contains("edelweis") || lower.contains("hutan") { return .green }
        return .gray
    }

    var body: some View {
        Text(text)
            .font(.system(size: 10, weight: .semibold))
            .foregroundStyle(resolvedStyle.foreground)
            .padding(.horizontal, 7)
            .padding(.vertical, 3)
            .background(resolvedStyle.background)
            .clipShape(Capsule())
            .overlay(
                Capsule()
                    .strokeBorder(resolvedStyle.foreground.opacity(0.25), lineWidth: 0.5)
            )
    }
}

#Preview {
    HStack {
        MountainBadgeChip(text: "Cocok Pemula")
        MountainBadgeChip(text: "Populer")
        MountainBadgeChip(text: "2D1N")
        MountainBadgeChip(text: "Ekspedisi")
    }
    .padding()
}
