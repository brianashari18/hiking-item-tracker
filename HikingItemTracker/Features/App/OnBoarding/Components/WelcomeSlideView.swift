//
//  WelcomeSlideView.swift
//  HikingItemTracker
//

import SwiftUI

struct WelcomeSlideView: View {
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
