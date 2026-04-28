//
//  BottomActionButton.swift
//  HikingItemTracker
//
//  Created by Brian Anashari on 19/04/26.
//

import SwiftUI

struct BottomActionButton: View {
    let title: String
    var progress: Double = 1.0
    var action: (() -> Void)? = nil

    var body: some View {
        Button(action: { action?() }) {
            GeometryReader { geo in
                ZStack(alignment: .leading) {
                    // Track (background abu-abu)
                    Color.green.opacity(0.25)

                    // Fill dari kiri ke kanan
                    Color.green
                        .frame(width: geo.size.width * CGFloat(progress))
                        .animation(.easeInOut(duration: 0.4), value: progress)
                }
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .overlay {
                    Text(title)
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                }
            }
            .frame(height: 52)
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 12)
        .background(.ultraThinMaterial)
    }
}
