//
//  FormSectionLabel.swift
//  HikingItemTracker
//
//  Created by Brian Anashari on 20/04/26.
//

import SwiftUI

struct FormSectionLabel: View {
    let title: String

    var body: some View {
        Text(title)
            .font(.body)
            .foregroundStyle(.secondary)
            .padding(.leading, 4)
            .padding(.top, 8)
    }
}
