//
//  MountainRepository.swift
//  HikingItemTracker
//
//  Created by Antigravity on 27/04/26.
//

import Foundation

final class MountainRepository {
    static let shared = MountainRepository()
    
    private init() {}
    
    func loadMountains() -> [Mountain] {
        guard let url = Bundle.main.url(forResource: "mountains", withExtension: "json") else {
            print("Failed to locate mountains.json in bundle.")
            return []
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            return try decoder.decode([Mountain].self, from: data)
        } catch {
            print("Failed to decode mountains.json: \(error)")
            return []
        }
    }
}
