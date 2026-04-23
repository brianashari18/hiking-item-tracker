//
//  MountainDetailCTAButton.swift
//  HikingItemTracker
//
//  Created by Brian Anashari on 23/04/26.
//

import SwiftUI

struct MountainDetailCTAButton: View {
    let gradeGradient: LinearGradient
    let gradeAccentColor: Color
    let selectedMountain: Mountain
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            HStack(spacing: 10) {
                Image(systemName: "checkmark.circle.fill")
                    .font(.headline)
                Text("Pilih Gunung Ini")
                    .font(.headline)
                    .fontWeight(.semibold)
            }
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity)
            .frame(height: 52)
            .background(gradeGradient)
            .clipShape(RoundedRectangle(cornerRadius: 26))
            .shadow(color: gradeAccentColor.opacity(0.4), radius: 12, y: 4)
        }
        .buttonStyle(.plain)
    }
}
