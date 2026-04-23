//
//  DetailInfoBlock.swift
//  HikingItemTracker
//
//  Created by Brian Anashari on 23/04/26.
//

import SwiftUI

struct DetailInfoBlock: View {
    let title: String
    let systemImage: String
    let description: String

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Label(title, systemImage: systemImage)
                .font(.headline)
                .foregroundStyle(.primary)

            Text(description)
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .fixedSize(horizontal: false, vertical: true)
        }
    }
}
