//
//  Mountain.swift
//  HikingItemTracker
//
//  Created by Brian Anashari on 16/04/26.
//

import Foundation

struct Mountain: Identifiable, Hashable {
    let id: UUID = UUID()
    let name: String
    let grade: String                   // "I", "II", "III", "IV", "V"
    let location: String
    let difficulty: String              // "Sangat Mudah", "Mudah", "Sedang", "Sulit", "Sangat Sulit"
    let estimatedDurationDays: Int      // lama pendakian dalam hari
    let altitude: Int                   // ketinggian puncak dalam meter
    let shortDescription: String        // ringkasan singkat untuk card
    let trailCharacteristics: String    // deskripsi jalur untuk detail sheet
    let badges: [String]                // contoh: ["Cocok Pemula", "2D1N", "Populer"]
    let isPopular: Bool
    let thumbnailSystemIcon: String     // SF Symbol untuk thumbnail

    // MARK: - Computed

    var durationBadge: String {
        estimatedDurationDays == 1 ? "1D" : "\(estimatedDurationDays)D\(estimatedDurationDays - 1)N"
    }

    var altitudeFormatted: String {
        "\(altitude.formatted()) mdpl"
    }

    var gradeColor: String {
        switch grade {
        case "I":  return "gradeI"
        case "II": return "gradeII"
        case "III": return "gradeIII"
        case "IV": return "gradeIV"
        case "V":  return "gradeV"
        default:   return "gradeII"
        }
    }

    /// Kategori ketinggian untuk logika generate checklist
    var altitudeCategory: AltitudeCategory {
        switch altitude {
        case ..<1500: return .low
        case 1500..<2500: return .medium
        case 2500..<3500: return .high
        default: return .veryHigh
        }
    }

    // MARK: - Hashable
    func hash(into hasher: inout Hasher) { hasher.combine(id) }
    static func == (lhs: Mountain, rhs: Mountain) -> Bool { lhs.id == rhs.id }
}

enum AltitudeCategory {
    case low        // < 1500 m
    case medium     // 1500–2500 m
    case high       // 2500–3500 m
    case veryHigh   // > 3500 m

    var sleepingBagRating: String {
        switch self {
        case .low:      return "Sleeping Bag +5°C"
        case .medium:   return "Sleeping Bag 0°C"
        case .high:     return "Sleeping Bag -5°C"
        case .veryHigh: return "Sleeping Bag -10°C"
        }
    }

    var needsLayering: Bool { self == .high || self == .veryHigh }
    var needsDownJacket: Bool { self == .veryHigh }
}
