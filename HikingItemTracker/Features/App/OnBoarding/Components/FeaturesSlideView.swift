//
//  FeaturesSlideView.swift
//  HikingItemTracker
//

import SwiftUI

struct FeaturesSlideView: View {
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
