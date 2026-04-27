//
//  GearNecessity.swift
//  HikingItemTracker
//
//  Created by Antigravity on 27/04/26.
//

import Foundation

enum GearNecessity: Equatable, Hashable {
    case universalEssential
    case optional
    case conditional([MountainType])
}
