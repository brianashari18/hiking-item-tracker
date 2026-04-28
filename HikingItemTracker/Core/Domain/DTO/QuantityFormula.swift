//
//  QuantityFormula.swift
//  HikingItemTracker
//
//  Created by Brian Anashari on 28/04/26.
//

import Foundation

enum QuantityFormula: String, Codable {
    /// Jumlah tetap sesuai baseQuantity
    case fixed
    /// baseQuantity × numberOfPeople
    case perPerson
    /// baseQuantity × duration
    case perDay
    /// baseQuantity × max(0, duration - 1) — untuk baju/celana ganti
    case perDayMinus1
    /// baseQuantity × duration — untuk makanan per hari
    case mealsPerDay

    func calculate(base: Int, duration: Int, numberOfPeople: Int) -> Int {
        switch self {
        case .fixed:        return base
        case .perPerson:    return base * numberOfPeople
        case .perDay:       return base * duration
        case .perDayMinus1: return base * max(0, duration - 1)
        case .mealsPerDay:  return base * duration
        }
    }
}
