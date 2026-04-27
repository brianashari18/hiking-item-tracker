//
//  MountainGrade.swift
//  HikingItemTracker
//
//  Created by Antigravity on 27/04/26.
//

import Foundation

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
}
