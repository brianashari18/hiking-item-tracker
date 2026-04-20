//
//  HikePhase.swift
//  HikingItemTracker
//
//  Created by Brian Anashari on 20/04/26.
//

import Foundation

enum HikePhase: String, CaseIterable, Identifiable {
    case istirahat = "Istirahat"
    case camping   = "Camping"
    case summit    = "Summit"
    case lainnya   = "Lainnya"

    var id: String { rawValue }
}
