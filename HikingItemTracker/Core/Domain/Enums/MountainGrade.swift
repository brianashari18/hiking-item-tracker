//
//  MountainGrade.swift
//  HikingItemTracker
//
//  Created by Brian Anashari on 27/04/26.
//

import SwiftUI

enum MountainGrade: String, CaseIterable, Codable, Hashable {
    case level1 = "I"
    case level2 = "II"
    case level3 = "III"
    case level4 = "IV"
    case level5 = "V"
    
    var difficulty: String {
        switch self {
        case .level1: return "Sangat Mudah"
        case .level2: return "Mudah"
        case .level3: return "Sedang"
        case .level4: return "Sulit"
        case .level5: return "Sangat Sulit"
        }
    }
    
    var accentColor: Color {
        switch self {
        case .level1: return Color(hue: 0.42, saturation: 0.6, brightness: 0.75)
        case .level2: return Color(hue: 0.55, saturation: 0.65, brightness: 0.75)
        case .level3: return Color(hue: 0.10, saturation: 0.70, brightness: 0.85)
        case .level4: return Color(hue: 0.03, saturation: 0.80, brightness: 0.80)
        case .level5: return Color(hue: 0.78, saturation: 0.60, brightness: 0.55)
        }
    }
    
    var gradient: LinearGradient {
        LinearGradient(
            colors: [
                accentColor.opacity(0.95),
                accentColor.opacity(0.75)
            ],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }
}
