//
//  Mountain.swift
//  HikingItemTracker
//
//  Created by Brian Anashari on 23/04/26.
//

import Foundation

struct Mountain: Identifiable, Hashable, Equatable, Codable {
    var id: UUID = UUID()
    let name: String
    let grade: MountainGrade
    let location: String
    let height: Int
    let duration: Int
    let isActive: Bool
    let type: [MountainType]
    let fauna: String
    let terrain: String
    let imageUrl: String
}
