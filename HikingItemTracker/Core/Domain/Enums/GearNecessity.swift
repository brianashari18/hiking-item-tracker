//
//  GearNecessity.swift
//  HikingItemTracker
//
//  Created by Antigravity on 27/04/26.
//

import Foundation

enum GearNecessity: Codable, Equatable, Hashable {
    case universalEssential
    case optional
    case conditional([MountainType])
    
    enum CodingKeys: String, CodingKey {
        case type, values
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(String.self, forKey: .type)
        switch type {
        case "universalEssential": self = .universalEssential
        case "optional": self = .optional
        case "conditional":
            let values = try container.decode([MountainType].self, forKey: .values)
            self = .conditional(values)
        default: throw DecodingError.dataCorruptedError(forKey: .type, in: container, debugDescription: "Unknown type")
        }
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
        case .universalEssential: try container.encode("universalEssential", forKey: .type)
        case .optional: try container.encode("optional", forKey: .type)
        case .conditional(let values):
            try container.encode("conditional", forKey: .type)
            try container.encode(values, forKey: .values)
        }
    }
}
