//
//  OnboardingView.swift
//  HikingItemTracker
//
//  Created by Brian Anashari on 15/04/26.
//

import SwiftUI

struct OnboardingView: View {
    @Environment(AppRouter.self) private var router
    @Environment(AppSession.self) private var session
    @State private var viewModel = OnboardingViewModel()
    
    var body: some View {
        ZStack {
            Color(UIColor.systemBackground).ignoresSafeArea()
            
            backgroundDecorations
            
            TabView(selection: $viewModel.currentIndex) {
                WelcomeSlideView(onContinue: viewModel.nextSlide)
                    .tag(0)
                
                FeaturesSlideView(onContinue: finishOnboarding)
                    .tag(1)
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .animation(.easeInOut(duration: 0.4), value: viewModel.currentIndex)
        }
    }
    
    private var backgroundDecorations: some View {
        GeometryReader { geometry in
            Circle()
                .fill(Color.green.opacity(0.1))
                .frame(width: 300, height: 300)
                .blur(radius: 50)
                .position(x: geometry.size.width * 0.9, y: geometry.size.height * 0.1)
            
            Circle()
                .fill(Color.blue.opacity(0.05))
                .frame(width: 250, height: 250)
                .blur(radius: 40)
                .position(x: geometry.size.width * 0.1, y: geometry.size.height * 0.8)
        }
        .ignoresSafeArea()
    }

    private func finishOnboarding() {
        session.hasCompletedOnboarding = true
        router.showMountainLibrary()
    }
}

#Preview {
    OnboardingView()
        .environment(AppRouter())
        .environment(AppSession())
}
