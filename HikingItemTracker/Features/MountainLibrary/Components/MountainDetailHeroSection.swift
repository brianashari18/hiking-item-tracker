//
//  MountainDetailHeroSection.swift
//  HikingItemTracker
//
//  Created by Brian Anashari on 23/04/26.
//

import SwiftUI

struct MountainDetailHeroSection: View {
    let mountain: Mountain
    let gradeAccentColor: Color
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Image(mountain.imageUrl)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity, maxHeight: 450)
                .overlay {
                    LinearGradient(
                        colors: [.clear, .black.opacity(0.55)],
                        startPoint: .center,
                        endPoint: .bottom
                    )
                }
            
            VStack(alignment: .leading, spacing: 6) {
                HStack(spacing: 6) {
                    Text("Grade \(mountain.grade)")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 4)
                        .background(gradeAccentColor.opacity(0.7))
                        .clipShape(Capsule())
                    
                    Text(mountain.difficulty)
                        .font(.caption)
                        .foregroundStyle(.white.opacity(0.85))
                }
                
                Text(mountain.name)
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                
                Label(mountain.location, systemImage: "mappin.and.ellipse")
                    .font(.subheadline)
                    .foregroundStyle(.white.opacity(0.85))
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 24)
        }
    }
}
