//
//  CheckEquipmentButton.swift
//  HikingItemTracker
//
//  Created by Brian Anashari on 20/04/26.
//

import SwiftUI

struct CheckEquipmentButton: View {
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack {
                Text("Cek Perlengkapan")
                    .font(.body)
                    .foregroundStyle(.primary)

                Spacer()

                Image(systemName: "chevron.right")
                    .font(.body)
                    .foregroundStyle(.secondary)
            }
            .padding(16)
            .background(Color.green.opacity(0.15))
            .clipShape(RoundedRectangle(cornerRadius: 14))
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    CheckEquipmentButton(action: {})
        .padding()
}
