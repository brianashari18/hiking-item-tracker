//
//  Mountain 2.swift
//  HikingItemTracker
//
//  Created by Brian Anashari on 23/04/26.
//

import Foundation

struct Mountain: Identifiable, Hashable {
    let id: UUID = UUID()
    let name: String
    let grade: String
    let location: String
    let difficulty: String
    let height: Int
    let duration: Int
    let status: String
    let fauna: String
    let terrain: String
    let equipment: String
}
