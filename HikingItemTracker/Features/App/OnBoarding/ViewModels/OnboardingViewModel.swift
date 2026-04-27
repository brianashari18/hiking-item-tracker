//
//  OnboardingViewModel.swift
//  HikingItemTracker
//
//  Created by Brian Anashari on 15/04/26.
//

import SwiftUI
import Observation

@Observable
final class OnboardingViewModel {
    var currentIndex: Int = 0
    
    func nextSlide() {
        withAnimation {
            currentIndex = 1
        }
    }
}
