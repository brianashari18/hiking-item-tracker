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
        Picker("Pilih Satuan", selection: $selectedUnit) {
            ForEach(ItemUnit.allCases) { unit in
                Text(unit.rawValue).tag(unit)
            }
        }
        .pickerStyle(.segmented)
    }
}

#Preview {
    UnitSelectorSegmented(selectedUnit: .constant(.gr))
        .padding()
}
