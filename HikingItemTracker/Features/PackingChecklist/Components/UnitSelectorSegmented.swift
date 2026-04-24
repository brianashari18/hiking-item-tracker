//
//  UnitSelectorSegmented.swift
//  HikingItemTracker
//
//  Created by Brian Anashari on 19/04/26.
//

import SwiftUI

struct UnitSelectorSegmented: View {
    @Binding var selectedUnit: ItemUnit

    var body: some View {
        HStack {
            Text("Unit Barang")
                .font(.body)

            Spacer()

            Menu {
                Picker("Pilih Unit", selection: $selectedUnit) {
                    ForEach(ItemUnit.allCases) { unit in
                        Text(unit.rawValue).tag(unit)
                    }
                }
            } label: {
                HStack(spacing: 4) {
                    Text(selectedUnit.rawValue)
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
    UnitSelectorSegmented(selectedUnit: .constant(.gr))
        .padding()
}
