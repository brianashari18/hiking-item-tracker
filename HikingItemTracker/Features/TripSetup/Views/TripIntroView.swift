//
//  TripIntroView.swift
//  HikingItemTracker
//
//  Created by Brian Anashari on 20/04/26.
//

import SwiftUI

struct TripIntroView: View {
    @Environment(AppRouter.self) private var router
    @State private var isAnimating = false

    var body: some View {
        ZStack {
            // Background gradient
            LinearGradient(
                colors: [
                    Color(hue: 0.38, saturation: 0.55, brightness: 0.18),
                    Color(hue: 0.40, saturation: 0.40, brightness: 0.12)
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            // Decorative circles
            Circle()
                .fill(Color(hue: 0.40, saturation: 0.6, brightness: 0.5).opacity(0.12))
                .frame(width: 340)
                .offset(x: 120, y: -200)
                .blur(radius: 20)

            Circle()
                .fill(Color(hue: 0.42, saturation: 0.5, brightness: 0.6).opacity(0.10))
                .frame(width: 280)
                .offset(x: -130, y: 280)
                .blur(radius: 20)

            // Content
            VStack(spacing: 0) {
                Spacer()

                // Headline
                VStack(spacing: 12) {
                    Text("Rencanakan\nPendakianmu")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                        .multilineTextAlignment(.center)
                        .scaleEffect(isAnimating ? 1 : 0.92)
                        .opacity(isAnimating ? 1 : 0)

                    Text("Jelajahi ribuan gunung di Indonesia\ndan buat perlengkapan yang tepat.")
                        .font(.subheadline)
                        .foregroundStyle(.white.opacity(0.72))
                        .multilineTextAlignment(.center)
                        .opacity(isAnimating ? 1 : 0)
                        .offset(y: isAnimating ? 0 : 8)
                }
                .padding(.horizontal, 32)

                Spacer()

                // Illustration
                illustrationView
                    .scaleEffect(isAnimating ? 1 : 0.85)
                    .opacity(isAnimating ? 1 : 0)
                    .offset(y: isAnimating ? 0 : 20)
                    .padding(.horizontal, 48)

                Spacer()

                // Feature pills
                featurePills
                    .opacity(isAnimating ? 1 : 0)
                    .offset(y: isAnimating ? 0 : 16)

                Spacer()

                // CTA Button
                Button {
                    router.showMountainLibrary()
                } label: {
                    HStack(spacing: 10) {
                        Image(systemName: "mountain.2.fill")
                            .font(.headline)
                        Text("Mulai Rencana Pendakian")
                            .font(.headline)
                            .fontWeight(.semibold)
                    }
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 56)
                    .background(
                        LinearGradient(
                            colors: [
                                Color(hue: 0.38, saturation: 0.75, brightness: 0.58),
                                Color(hue: 0.42, saturation: 0.70, brightness: 0.48)
                            ],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 28))
                    .shadow(
                        color: Color(hue: 0.40, saturation: 0.7, brightness: 0.5).opacity(0.5),
                        radius: 16, y: 6
                    )
                }
                .padding(.horizontal, 32)
                .padding(.bottom, 52)
                .scaleEffect(isAnimating ? 1 : 0.95)
                .opacity(isAnimating ? 1 : 0)
            }
        }
        .onAppear {
            withAnimation(.spring(response: 0.7, dampingFraction: 0.8).delay(0.15)) {
                isAnimating = true
            }
        }
    }

    // MARK: - Illustration

    private var illustrationView: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 24)
                .fill(.white.opacity(0.07))
                .frame(height: 220)
                .overlay(
                    RoundedRectangle(cornerRadius: 24)
                        .strokeBorder(.white.opacity(0.12), lineWidth: 1)
                )

            HStack(spacing: 0) {
                Image(systemName: "mountain.2.fill")
                    .font(.system(size: 72))
                    .foregroundStyle(
                        LinearGradient(
                            colors: [.white.opacity(0.9), .white.opacity(0.5)],
                            startPoint: .top, endPoint: .bottom
                        )
                    )
                    .shadow(color: .black.opacity(0.3), radius: 8, y: 4)
            }
        }
    }

    // MARK: - Feature Pills

    private var featurePills: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(featureItems, id: \.0) { icon, label in
                    HStack(spacing: 6) {
                        Image(systemName: icon)
                            .font(.caption)
                            .foregroundStyle(Color(hue:0.40,saturation:0.7,brightness:0.70))
                        Text(label)
                            .font(.caption)
                            .fontWeight(.medium)
                            .foregroundStyle(.white.opacity(0.85))
                    }
                    .padding(.horizontal, 12)
                    .padding(.vertical, 7)
                    .background(.white.opacity(0.1))
                    .clipShape(Capsule())
                    .overlay(Capsule().strokeBorder(.white.opacity(0.15), lineWidth: 0.5))
                }
            }
            .padding(.horizontal, 32)
        }
    }

    private var featureItems: [(String, String)] {
        [
            ("mountain.2.fill", "30+ Gunung"),
            ("slider.horizontal.3", "Filter Cerdas"),
            ("checklist", "Auto Checklist"),
            ("person.2.fill", "Multi Orang")
        ]
    }
}

#Preview {
    TripIntroView()
        .environment(AppRouter())
}
