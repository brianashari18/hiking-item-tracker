//
//  MountainType.swift
//  HikingItemTracker
//
//  Created by Brian Anashari on 27/04/26.
//

import Foundation

enum MountainType: String, CaseIterable, Codable, Hashable {
    case poisonous
    case volcanic
    case sandy
    case rocky
    case steep
    case slippery
    case mossy
    case muddy
    case rooted
    case foggy
    case cold
    case climbing
    case forest
    case humid
    case dry

    var displayName: String {
        switch self {
        case .poisonous: return "Berbahaya"
        case .volcanic:  return "Vulkanik"
        case .sandy:     return "Berpasir"
        case .rocky:     return "Berbatu"
        case .steep:     return "Terjal"
        case .slippery:  return "Licin"
        case .mossy:     return "Berlumut"
        case .muddy:     return "Berlumpur"
        case .rooted:    return "Berakar"
        case .foggy:     return "Berkabut"
        case .cold:      return "Dingin"
        case .climbing:  return "Panjat Tebing"
        case .forest:    return "Hutan Lebat"
        case .humid:     return "Lembab"
        case .dry:       return "Kering"
        }
    }

    var iconName: String {
        switch self {
        case .poisonous: return "exclamationmark.triangle.fill"
        case .volcanic:  return "flame.fill"
        case .sandy:     return "sun.haze.fill"
        case .rocky:     return "mountain.2.fill"
        case .steep:     return "arrow.up.right.circle.fill"
        case .slippery:  return "drop.fill"
        case .mossy:     return "leaf.fill"
        case .muddy:     return "cloud.rain.fill"
        case .rooted:    return "tree.fill"
        case .foggy:     return "cloud.fog.fill"
        case .cold:      return "snowflake"
        case .climbing:  return "figure.climbing"
        case .forest:    return "tree.fill"
        case .humid:     return "humidity.fill"
        case .dry:       return "sun.max.fill"
        }
    }
}

