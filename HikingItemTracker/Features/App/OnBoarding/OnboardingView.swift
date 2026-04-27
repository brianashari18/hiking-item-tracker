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
    @State private var currentIndex: Int = 0
    
    var body: some View {
        ZStack {
            Color(UIColor.systemBackground).ignoresSafeArea()
            
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

            TabView(selection: $currentIndex) {
                WelcomeSlideView(onContinue: nextSlide)
                    .tag(0)
                
                FeaturesSlideView(onContinue: finishOnboarding)
                    .tag(1)
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .animation(.easeInOut(duration: 0.4), value: currentIndex)
        }
    }

    private func nextSlide() {
        withAnimation {
            currentIndex = 1
        }
    }

    private func finishOnboarding() {
        session.hasCompletedOnboarding = true
        router.showMountainLibrary()
    }
}

private struct WelcomeSlideView: View {
    let onContinue: () -> Void
    
    var body: some View {
        VStack(spacing: 0) {
            Spacer()
            
            ZStack {
                Image("img_onboarding")
                    .resizable()
                    .scaledToFill()
                
                LinearGradient(
                    gradient: Gradient(colors: [.black.opacity(0.1), .clear]),
                    startPoint: .bottom,
                    endPoint: .top
                )
            }
            .frame(maxWidth: 340)
            .aspectRatio(1, contentMode: .fit)
            .clipShape(RoundedRectangle(cornerRadius: 32, style: .continuous))
            .shadow(color: Color.green.opacity(0.1), radius: 15, x: 0, y: 8)
            .padding(.horizontal, 24)
            .padding(.bottom, 40)
            
            // Content
            VStack(spacing: 16) {
                Text("Selamat Datang di\nMuncakin")
                    .font(.system(size: 34, weight: .bold))
                    .kerning(-0.5)
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.center)
                
                Text("Temukan, rencanakan, dan pantau setiap langkah pendakianmu dengan lebih aman dan terorganisir.")
                    .font(.system(size: 17))
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 32)
            }
            .padding(.bottom, 40)
            
            Spacer()
            
            // Action
            VStack(spacing: 24) {
                Button(action: onContinue) {
                    Text("Lanjutkan")
                        .font(.system(size: 17, weight: .semibold))
                        .frame(maxWidth: .infinity)
                        .frame(height: 56)
                        .background(Color.green)
                        .foregroundColor(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                        .shadow(color: Color.green.opacity(0.3), radius: 10, x: 0, y: 5)
                }
                .buttonStyle(ScaleButtonStyle())
                
                // Pagination
                HStack(spacing: 8) {
                    Capsule()
                        .fill(Color.green)
                        .frame(width: 20, height: 8)
                    Circle()
                        .fill(Color(UIColor.systemGray4))
                        .frame(width: 8, height: 8)
                }
            }
            .padding(.horizontal, 24)
            .padding(.bottom, 40)
        }
    }
}

private struct FeaturesSlideView: View {
    let onContinue: () -> Void
    
    var body: some View {
        VStack(spacing: 0) {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 32) {
                    VStack(spacing: 12) {
                        Text("Fitur Unggulan")
                            .font(.system(size: 32, weight: .bold))
                            .foregroundColor(.primary)
                        
                        Text("Semua yang kamu butuhkan untuk pendakian yang sukses dalam satu aplikasi.")
                            .font(.system(size: 16))
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 32)
                    }
                    .padding(.top, 60)
                    
                    VStack(spacing: 16) {
                        OnboardingFeatureCard(
                            icon: "mountain.2.fill",
                            iconColor: .green,
                            title: "Rencana Matang",
                            description: "Pilih gunung dan atur jadwal pendakian dengan data medan yang akurat."
                        )
                        
                        OnboardingFeatureCard(
                            icon: "backpack.fill",
                            iconColor: .blue,
                            title: "Manajemen Barang",
                            description: "Kelola perlengkapan pribadi dan kelompok agar tidak ada yang tertinggal."
                        )
                        
                        OnboardingFeatureCard(
                            icon: "checklist.checked",
                            iconColor: .orange,
                            title: "Pantau Progres",
                            description: "Cek kesiapan barang bawaanmu secara real-time sebelum berangkat."
                        )
                    }
                    .padding(.horizontal, 24)
                }
            }
            
            VStack(spacing: 24) {
                Button(action: onContinue) {
                    HStack(spacing: 8) {
                        Text("Mulai Sekarang")
                        Image(systemName: "arrow.right")
                    }
                    .font(.system(size: 17, weight: .semibold))
                    .frame(maxWidth: .infinity)
                    .frame(height: 56)
                    .background(Color.green)
                    .foregroundColor(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                    .shadow(color: Color.green.opacity(0.3), radius: 10, x: 0, y: 5)
                }
                .buttonStyle(ScaleButtonStyle())
                
                HStack(spacing: 8) {
                    Circle()
                        .fill(Color(UIColor.systemGray4))
                        .frame(width: 8, height: 8)
                    Capsule()
                        .fill(Color.green)
                        .frame(width: 20, height: 8)
                }
            }
            .padding(.horizontal, 24)
            .padding(.bottom, 40)
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color(UIColor.systemBackground),
                        Color(UIColor.systemBackground).opacity(0)
                    ]),
                    startPoint: .bottom,
                    endPoint: .top
                )
                .frame(height: 150)
                .allowsHitTesting(false),
                alignment: .bottom
            )
        }
    }
}

private struct OnboardingFeatureCard: View {
    let icon: String
    let iconColor: Color
    let title: String
    let description: String
    
    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            RoundedRectangle(cornerRadius: 14, style: .continuous)
                .fill(iconColor.opacity(0.1))
                .frame(width: 52, height: 52)
                .overlay(
                    Image(systemName: icon)
                        .font(.system(size: 24, weight: .semibold))
                        .foregroundColor(iconColor)
                )
            
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.primary)
                
                Text(description)
                    .font(.system(size: 14))
                    .foregroundColor(.secondary)
                    .fixedSize(horizontal: false, vertical: true)
            }
            
            Spacer(minLength: 0)
        }
        .padding(24)
        .background(
            RoundedRectangle(cornerRadius: 24, style: .continuous)
                .fill(Color(.secondarySystemGroupedBackground))
        )
        .shadow(color: Color.black.opacity(0.03), radius: 10, x: 0, y: 5)
    }
}

struct ScaleButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.98 : 1.0)
            .opacity(configuration.isPressed ? 0.9 : 1.0)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}

#Preview {
    OnboardingView()
        .environment(AppRouter())
        .environment(AppSession())
}
