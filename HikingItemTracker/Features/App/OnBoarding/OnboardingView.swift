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
    @State private var currentIndex: Int = 0
    
    init() {
        UIPageControl.appearance().currentPageIndicatorTintColor = .green.withAlphaComponent(0.5)
            UIPageControl.appearance().pageIndicatorTintColor = UIColor.green.withAlphaComponent(0.25)
        }
    
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            
            Text(viewModel.slides[currentIndex].title)
                .font(.title2)
                .bold()
                .multilineTextAlignment(.center)
                .padding(.horizontal, 30)
        
            TabView(selection: $currentIndex) {
                ForEach(Array(viewModel.slides.enumerated()), id: \.element.id) { index, slide in
                    VStack {
                        Image(systemName: slide.systemImageName)
                            .resizable()
                            .scaledToFit()
                            .padding(40)
                    }
                    .frame(width: 320, height: 320)
                    .background(Color.black.opacity(0.1))
                    .cornerRadius(20)
                    .tag(index)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .always))
            .frame(height: 400)
            .frame(maxWidth: .infinity, alignment: .leading)
            .allowsHitTesting(false)
            
            Text(viewModel.slides[currentIndex].message)
                .font(.body)
                .fontWeight(.medium)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 30)
                .id(currentIndex)
                .transition(.asymmetric(
                            insertion: .move(edge: .trailing),
                            removal: .move(edge: .leading)
                        ))
            
            Spacer()
            
            Button(action: handlePrimaryAction) {
                Text(currentIndex == viewModel.slides.count - 1 ? "Mulai" : "Next")
                    .fontWeight(.bold)
                    .buttonStyle(.plain)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .foregroundColor(.white)
                    .background(.green.opacity(0.8))
                    .cornerRadius(20)
                
            }
            .padding(.horizontal, 30)
            .padding(.bottom, 20)
        }
        .padding(.vertical, 10)
        .animation(.easeInOut(duration: 0.3), value: currentIndex)
    }

    private func handlePrimaryAction() {
        if currentIndex < viewModel.slides.count - 1 {
            withAnimation(.easeInOut(duration: 0.3)) {
                currentIndex += 1
            }
            return
        }

        session.hasCompletedOnboarding = true
        router.showMountainLibrary()
    }
}

#Preview {
    OnboardingView()
        .environment(AppRouter())
        .environment(AppSession())
}
