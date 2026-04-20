//
//  HikeProgressRing.swift
//  HikingItemTracker
//
//  Created by Brian Anashari on 20/04/26.
//

import SwiftUI

struct HikeProgressRing: View {
    let progress: CGFloat   // 0.0 – 1.0
    let size: CGFloat

    private var lineWidth: CGFloat { size * 0.10 }

    var body: some View {
        ZStack {
            Circle()
                .stroke(Color.green.opacity(0.2), lineWidth: lineWidth)

            Circle()
                .trim(from: 0, to: progress)
                .stroke(
                    Color.green,
                    style: StrokeStyle(lineWidth: lineWidth, lineCap: .round)
                )
                .rotationEffect(.degrees(-90))
                .animation(.easeInOut(duration: 0.4), value: progress)

            Text("\(Int(progress * 100))%")
                .font(.system(size: size * 0.22, weight: .semibold))
                .foregroundStyle(.primary)
        }
        .frame(width: size, height: size)
    }
}

#Preview {
    HikeProgressRing(progress: 0.75, size: 56)
        .padding()
}
