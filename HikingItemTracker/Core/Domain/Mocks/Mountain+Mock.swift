//
//  MountainMock.swift
//  HikingItemTracker
//
//  Created by Brian Anashari on 16/04/26.
//

import Foundation

extension Mountain {
    static var mocks: [Mountain] {
        MountainRepository.shared.loadMountains()
    }
}
