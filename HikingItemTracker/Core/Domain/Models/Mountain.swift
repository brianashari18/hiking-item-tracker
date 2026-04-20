//
//  Mountain.swift
//  HikingItemTracker
//
//  Created by Brian Anashari on 16/04/26.
//

import Foundation

struct Mountain: Identifiable {
    let id: UUID = UUID()
    let name: String
    let grade: String
    let location: String
    let difficulty: String
    let duration: Int
}
