//
//  MountainListRow.swift
//  HikingItemTracker
//
//  Created by Brian Anashari on 16/04/26.
//

import SwiftUI

struct MountainListRow: View {
    let mountain: Mountain
    let isSelected: Bool
    let onTap: () -> Void

    var body: some View {
        Button(action: onTap) {
            HStack(alignment: .center) {
                VStack(alignment: .leading, spacing: 4) {
                    Text(mountain.name)
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                    
                    Text("Grade \(mountain.grade) • \(mountain.difficulty) (\(mountain.estimatedDurationDays) Hari)")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    
                    HStack(spacing: 4) {
                        Image(systemName: "mappin.and.ellipse")
                            .font(.caption)
                        Text(mountain.location)
                            .font(.subheadline)
                    }
                    .foregroundColor(.secondary)
                }
                
                Spacer()
                
                if isSelected {
                    Image(systemName: "checkmark")
                        .foregroundStyle(.blue)
                        .fontWeight(.semibold)
                }
            }
            .padding(.vertical, 4)
        }
        .buttonStyle(.plain)
    }
}
