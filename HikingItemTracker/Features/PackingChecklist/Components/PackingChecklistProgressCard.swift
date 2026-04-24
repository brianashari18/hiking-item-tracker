//
//  PackingChecklistProgressCard.swift
//  HikingItemTracker
//
//  Created by Brian Anashari on 19/04/26.
//

import SwiftUI

struct PackingChecklistProgressCard: View {
    let percentage: CGFloat

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Kelengkapan Barang")
                .font(.headline)
                .fontWeight(.semibold)
                .foregroundStyle(.white)

            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(height: 10)
                        .foregroundStyle(.white)

                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: geometry.size.width * percentage, height: 10)
                        .foregroundStyle(Color(red: 77/255, green: 143/255, blue: 145/255))
                }
            }
            .frame(height: 10)

            Text("\(Int(percentage * 100))% selesai")
                .font(.footnote)
                .foregroundStyle(.white)
        }
        .padding()
        .background(Color.green.opacity(0.8))
        .clipShape(RoundedRectangle(cornerRadius: 15))
    }
}
