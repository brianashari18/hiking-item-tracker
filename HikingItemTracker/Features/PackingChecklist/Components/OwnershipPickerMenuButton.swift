//
//  OwnershipPickerMenuButton.swift
//  HikingItemTracker
//
//  Created by Brian Anashari on 19/04/26.
//

import SwiftUI

struct OwnershipPickerMenuButton: View {
    @Binding var selectedOwnership: ItemOwnership

    var body: some View {
        HStack {
            Text("Kepemilikan Barang")
                .font(.body)

            Spacer()

            Menu {
                Picker("Pilih Kepemilikan", selection: $selectedOwnership) {
                    ForEach(ItemOwnership.allCases) { ownership in
                        Text(ownership.rawValue).tag(ownership)
                    }
                }
            } label: {
                HStack(spacing: 4) {
                    Text(selectedOwnership.rawValue)
                        .font(.body)
                        .foregroundStyle(.secondary)
                        .lineLimit(1)
                    Image(systemName: "chevron.up.chevron.down")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
            }
            .tint(.primary)
        }
    }
}

#Preview {
    ZStack {
        Color(.systemGroupedBackground).ignoresSafeArea()
        
        OwnershipPickerMenuButton(selectedOwnership: .constant(.pribadi))
            .padding()
    }
}
