//
//  NecessityTemplate.swift
//  HikingItemTracker
//
//  Created by Brian Anashari on 28/04/26.
//

import Foundation

enum NecessityTemplate: String, Codable {
    case universalEssential
    case optional
    case conditional

    func toGearNecessity(requiredTypes: [MountainType]) -> GearNecessity {
        switch self {
        case .universalEssential: return .universalEssential
        case .optional:           return .optional
        case .conditional:        return .conditional(requiredTypes)
        }
    }
}
