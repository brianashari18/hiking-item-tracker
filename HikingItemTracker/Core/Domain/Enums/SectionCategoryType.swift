//
//  SectionCategoryType.swift
//  HikingItemTracker
//
//  Created by Brian Anashari on 19/04/26.
//

import Foundation

enum SectionCategoryType: Codable, Equatable {
    case functional(ItemFunctionalCategory)
    case zone(ItemZoneCategory)

    enum CodingKeys: String, CodingKey {
        case type, value
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(String.self, forKey: .type)
        switch type {
        case "functional":
            let value = try container.decode(ItemFunctionalCategory.self, forKey: .value)
            self = .functional(value)
        case "zone":
            let value = try container.decode(ItemZoneCategory.self, forKey: .value)
            self = .zone(value)
        default:
            throw DecodingError.dataCorruptedError(forKey: .type, in: container, debugDescription: "Unknown type")
        }
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
        case .functional(let value):
            try container.encode("functional", forKey: .type)
            try container.encode(value, forKey: .value)
        case .zone(let value):
            try container.encode("zone", forKey: .type)
            try container.encode(value, forKey: .value)
        }
    }

    var title: String {
        switch self {
        case .functional(let cat): return cat.rawValue
        case .zone(let zone):      return zone.rawValue
        }
    }
}
