//
//  ItemUnit.swift
//  HikingItemTracker
//
//  Created by Brian Anashari on 19/04/26.
//

import Foundation

enum ItemUnit: String, CaseIterable, Identifiable {
    case gr = "gr"
    case kg = "kg"
    case ml = "ml"
    case l = "L"
    case pcs = "pcs"

    var id: String { rawValue }
}
