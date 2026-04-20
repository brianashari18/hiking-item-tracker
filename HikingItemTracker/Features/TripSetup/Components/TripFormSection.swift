//
//  TripFormSection.swift
//  HikingItemTracker
//
//  Created by Brian Anashari on 15/04/26.
//

import SwiftUI

struct TripFormSection<Content: View>: View {
    let title: String
    @ViewBuilder let content: Content

    var body: some View {
        VStack(alignment: .leading, spacing: 7) {
            Text(title)
                .font(.body)
                .foregroundStyle(.primary)
//                .fontWeight(.bold)

            content
        }
    }
}
