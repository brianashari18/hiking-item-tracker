//
//  PackingChecklistOptionsMenuButton.swift
//  HikingItemTracker
//
//  Created by Brian Anashari on 19/04/26.
//

import SwiftUI

struct PackingChecklistOptionsMenuButton: View {
    @Binding var groupingMode: PackingChecklistGroupingMode
    let onAddItem: () -> Void

    var body: some View {
        HStack(spacing: 8) {
            Menu {
                Button(action: {}) {
                    Label("Bag View", systemImage: "briefcase")
                }

                Button(action: {
                    
                }) {
                    Label("Checklist Semua", systemImage: "checkmark.circle")
                }

                Divider()

                Picker("Kategori Berdasarkan", selection: $groupingMode) {
                    ForEach(PackingChecklistGroupingMode.allCases) { mode in
                        Text(mode.displayTitle).tag(mode)
                    }
                }
                
                Button {
                    
                } label: {
                    Text("Cancel")
                }
            } label: {
                Image(systemName: "ellipsis")
                    .font(.headline)
                    .foregroundStyle(.black)
                    .frame(width: 36, height: 36)
                    .background(Color.white)
                    .clipShape(Circle())
                    .shadow(radius: 1)
            }

            Button(action: onAddItem) {
                Image(systemName: "plus")
                    .font(.headline)
                    .foregroundStyle(.black)
                    .frame(width: 36, height: 36)
                    .background(Color.white)
                    .clipShape(Circle())
                    .shadow(radius: 1)
            }
        }
    }
}
