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
        Menu {
            Picker("Pilih Kepemilikan", selection: $selectedOwnership) {
                ForEach(ItemOwnership.allCases) { ownership in
                    Text(ownership.rawValue).tag(ownership)
                }
            }
        } label: {
            HStack {
                Text(selectedOwnership.rawValue)
                    .font(.body)
                    .foregroundStyle(.primary)

                Spacer()

                Image(systemName: "chevron.down")
                    .font(.body)
                    .foregroundStyle(.primary)
            }
            .background(Color(.systemBackground))
            .clipShape(RoundedRectangle(cornerRadius: 12))
        }
        .tint(.primary)
    }
}

#Preview {
    ZStack {
        Color(.systemGroupedBackground).ignoresSafeArea()
        
        OwnershipPickerMenuButton(selectedOwnership: .constant(.pribadi))
            .padding()
    }
}
