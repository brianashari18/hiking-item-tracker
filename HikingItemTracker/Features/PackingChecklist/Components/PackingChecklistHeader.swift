//
//  PackingChecklistHeaderView.swift
//  HikingItemTracker
//
//  Created by Brian Anashari on 19/04/26.
//

import SwiftUI

struct PackingChecklistHeader: View {
    let title: String
    let date: String

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(.primary)

            Text(date)
                .font(.subheadline)
                .foregroundStyle(.primary)
        }
    }
}
