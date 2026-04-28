//
//  PackingChecklistProgressCard.swift
//  HikingItemTracker
//
//  Created by Brian Anashari on 19/04/26.
//

import SwiftUI

struct PackingChecklistProgressCard: View {
    let sections: [LogisticSectionModel]

    private var incompleteSections: [LogisticSectionModel] {
        sections.filter { $0.itemCount < $0.totalCount }
    }

    private var isComplete: Bool {
        incompleteSections.isEmpty
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            // Header
            HStack {
                Text(isComplete ? "Semua Barang Siap" : "Barang yang Belum Dilengkapi")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)

                Spacer()

                if isComplete {
                    Text("Siap Berangkat")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundStyle(Color(red: 77/255, green: 143/255, blue: 145/255))
                        .padding(.horizontal, 10)
                        .padding(.vertical, 4)
                        .background(.white)
                        .clipShape(Capsule())
                }
            }

            if !isComplete {
                // Per-category chips
                LazyVGrid(
                    columns: [GridItem(.flexible()), GridItem(.flexible())],
                    alignment: .leading,
                    spacing: 8
                ) {
                    ForEach(incompleteSections) { section in
                        let remaining = section.totalCount - section.itemCount
                        HStack(spacing: 6) {
                            Text("\(remaining)")
                                .font(.subheadline)
                                .fontWeight(.bold)
                                .foregroundStyle(Color(red: 77/255, green: 143/255, blue: 145/255))
                                .frame(width: 28, height: 28)
                                .background(.white)
                                .clipShape(Circle())

                            Text(section.title)
                                .font(.caption)
                                .fontWeight(.medium)
                                .foregroundStyle(.white)
                                .lineLimit(1)
                        }
                        .padding(.horizontal, 10)
                        .padding(.vertical, 6)
                        .background(.white.opacity(0.2))
                        .clipShape(Capsule())
                    }
                }
            }
        }
        .padding()
        .background(Color(red: 77/255, green: 143/255, blue: 145/255))
        .clipShape(RoundedRectangle(cornerRadius: 15))
    }
}


#Preview {
    let sections = [
        LogisticSectionModel(categoryType: .functional(.personalItem), items: [
            GearItem(name: "Jaket", quantity: 1, functionalCategory: .personalItem, zoneCategory: .bottom, isPacked: false),
            GearItem(name: "Celana", quantity: 1, functionalCategory: .personalItem, zoneCategory: .bottom, isPacked: true),
        ]),
        LogisticSectionModel(categoryType: .functional(.safetyTools), items: [
            GearItem(name: "Kompas", quantity: 1, functionalCategory: .safetyTools, zoneCategory: .top, isPacked: false),
        ]),
    ]
    PackingChecklistProgressCard(sections: sections)
        .padding()
}
