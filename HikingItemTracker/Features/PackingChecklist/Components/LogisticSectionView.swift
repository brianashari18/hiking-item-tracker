//
//  LogisticSectionView.swift
//  HikingItemTracker
//
//  Created by Brian Anashari on 19/04/26.
//

import SwiftUI

struct LogisticSectionView: View {
    let sectionData: LogisticSectionModel
    let onTogglePacked: (LogisticItem) -> Void
    let onToggleSectionPacked: (LogisticSectionModel) -> Void
    let onTapItem: (LogisticItem) -> Void
    let onDeleteItem: (LogisticItem) -> Void

    init(
        sectionData: LogisticSectionModel,
        onTogglePacked: @escaping (LogisticItem) -> Void,
        onToggleSectionPacked: @escaping (LogisticSectionModel) -> Void,
        onTapItem: @escaping (LogisticItem) -> Void,
        onDeleteItem: @escaping (LogisticItem) -> Void
    ) {
        self.sectionData = sectionData
        self.onTogglePacked = onTogglePacked
        self.onToggleSectionPacked = onToggleSectionPacked
        self.onTapItem = onTapItem
        self.onDeleteItem = onDeleteItem
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            sectionHeader
            itemList
        }
    }

    private var sectionHeader: some View {
        HStack(alignment: .bottom) {
            Text(sectionData.title)
                .font(.headline)
                .fontWeight(.bold)
                .foregroundStyle(.primary)

            Spacer()

            HStack {
                Button {
                    onToggleSectionPacked(sectionData)
                } label: {
                    Image(systemName: sectionData.itemCount == sectionData.totalCount ? "checkmark.circle.fill" : "circle")
                        .foregroundStyle(sectionData.itemCount == sectionData.totalCount ? .green : .secondary)
                }
                
                Text("\(sectionData.itemCount)/\(sectionData.totalCount)")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
        }
        .padding(.horizontal, 4)
    }

    private var itemList: some View {
        LazyVStack(spacing: 0) {
            ForEach(sectionData.items) { item in
                LogisticItemRow(
                    item: item,
                    onTogglePacked: { onTogglePacked(item) },
                    onTapDetails: { onTapItem(item) }
                )
                .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                    Button(role: .destructive) {
                        onDeleteItem(item)
                    } label: {
                        Label("Hapus", systemImage: "trash")
                    }
                }

                if item.id != sectionData.items.last?.id {
                    Divider()
                        .padding(.leading, 40)
                }
            }
        }
        .padding(.horizontal)
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}
